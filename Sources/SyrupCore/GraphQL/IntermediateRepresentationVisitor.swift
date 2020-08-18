/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2020 Shopify Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import Foundation
import SwiftGraphQLParser

class IntermediateRepresentationVisitor: GraphQLBaseVisitor {
	private let schema: Schema
	private let scalars: [ScalarType]
	private let queries: [String: String]
	private let mutations: [String: String]
	private let fragments: [String: String]
	private let subscriptions: [String: String]

	private var operations: [IntermediateRepresentation.OperationDefinition] = []
	private var fragmentDefinitions: [IntermediateRepresentation.FragmentDefinition] = []
	private var referencedEnums: Set<IntermediateRepresentation.EnumType> = []
	private var referencedInputTypes: Set<IntermediateRepresentation.InputType> = []
	var intermediateRepresentation: IntermediateRepresentation {
		return IntermediateRepresentation(operations: operations, fragmentDefinitions: fragmentDefinitions, referencedEnums: Array(referencedEnums), referencedInputTypes: Array(referencedInputTypes))
	}
	
	private var parentType = Stack<Schema.SchemaType>()
	private var parsedVariables: [IntermediateRepresentation.Variable] = []
	private var variableType: IntermediateRepresentation.Variable.VariableType? = nil
	private var isParsingVariableDeclaration: Bool = false
	private var parsedSelections = Stack<[IntermediateRepresentation.Selection]>()
	private var selectionContainsConditionalDirective = Stack<Bool>()
	private var currentSelectionType = Stack<SelectionType>()
	private var referencedVariables = Stack<[String]>()
	enum SelectionType {
		case field
		case fragmentSpread
		case inlineFragment
	}
	
	struct Error: LocalizedError {
		let description: String
		
		var errorDescription: String? {
			return description
		}
	}
	
	required init(schema: Schema, customScalars: [ScalarType], builtInScalars: TemplateSpec.BuiltInScalars, queries: [String: String], mutations: [String: String], fragments: [String: String], subscriptions: [String: String]) {
		self.schema = schema
		self.queries = queries
		self.mutations = mutations
		self.fragments = fragments
		self.subscriptions = subscriptions
		self.scalars = IntermediateRepresentationVisitor.mergeScalarTypes(customScalars: customScalars, builtInScalars: builtInScalars)

		super.init()
	}
	
	override func visitOperation(operation: SwiftGraphQLParser.Operation) throws {
		let schemaType: Schema.SchemaType
		switch operation.operationType {
		case .query:
			schemaType = schema.queryType
		case .mutation:
			schemaType = schema.mutationType!
		case .subscription:
			schemaType = schema.subscriptionType!
		default:
			throw Error(description: "Cannot create operation type of \(operation.operationType)")
		}
		parentType.push(schemaType)
	}
	
	override func exitOperation(operation: SwiftGraphQLParser.Operation) {
		let name = operation.name!
		let selections = parsedSelections.pop()
		parentType.pop()
		let type: IntermediateRepresentation.OperationType
		let operationString: String
		let typeName: String
		switch operation.operationType {
		case .query:
			type = .query
			operationString = queries[name]!
			typeName = schema.queryType.name
		case .mutation:
			type = .mutation
			operationString = mutations[name]!
			typeName = schema.mutationType!.name
		case .subscription:
			type = .subscription
			operationString = subscriptions[name]!
			typeName = schema.subscriptionType!.name
		}
		let variables = parsedVariables
		let operationDefinition = IntermediateRepresentation.OperationDefinition(name: name, selections: selections, typeName: typeName, type: type, variables: variables, operation: operationString)
		operations.append(operationDefinition)
		parsedVariables = []
	}
	
	override func visitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) {
		self.isParsingVariableDeclaration = true
	}
	
	override func exitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) {
		let name = variableDefinition.variable.name
		let variableType = self.variableType!
		let variable = IntermediateRepresentation.Variable(name: name, type: variableType)
		parsedVariables.append(variable)
		self.isParsingVariableDeclaration = false
	}
	
	override func visitSelectionSet(selectionSet: [SwiftGraphQLParser.Selection]) {
		parsedSelections.push([])
	}
	
	override func visitField(field: SwiftGraphQLParser.Field) {
		currentSelectionType.push(.field)
		selectionContainsConditionalDirective.push(false)
		referencedVariables.push([])
		if (field.selectionSet?.count ?? 0) > 0 {
			let fieldType = schema.topLevelType(of: field.name, on: parentType.peek())
			parentType.push(fieldType)
		}
	}
	
	override func exitField(field: SwiftGraphQLParser.Field) throws {
		currentSelectionType.pop()
		let currentReferencedVariables = referencedVariables.pop()
		guard field.name != IntermediateRepresentation.typeNameField else {
			let hasConditionalDirective = selectionContainsConditionalDirective.pop()
			let scalarType = scalars.first(where: { $0.graphType == TemplateSpec.BuiltInScalars.GraphQLScalar.string.rawValue })!
			let parsedField = IntermediateRepresentation.Field(
				name: field.name,
				type: .nonNull(.scalar(scalarType)),
				attributes: IntermediateRepresentation.Attributes(description: nil, isDeprecated: false, deprecationReason: nil),
				hasConditionalDirective: hasConditionalDirective,
				referencedVariables: currentReferencedVariables
			)
			var selections = parsedSelections.pop()
			selections.append(.field(parsedField))
			parsedSelections.push(selections)
			return
		}
		if (field.selectionSet?.count ?? 0) > 0 {
			parentType.pop()
		}
		let fieldName = field.alias ?? field.name
		let schemaField = parentType.peek().field(named: field.name)
		let schemaType = schemaField.type
		let type = try parseType(schemaType: schemaType, fieldName: fieldName)
		let hasConditionalDirective = selectionContainsConditionalDirective.pop()
		let parsedField = IntermediateRepresentation.Field(
			name: fieldName,
			type: type,
			attributes: IntermediateRepresentation.Attributes(field: schemaField),
			hasConditionalDirective: hasConditionalDirective,
			referencedVariables: currentReferencedVariables
		)
		var selections = parsedSelections.pop()
		selections.append(.field(parsedField))
		parsedSelections.push(selections)
	}
	
	private func parseType(schemaType: Schema.SchemaType, fieldName: String) throws -> IntermediateRepresentation.FieldType {
		switch schemaType.kind {
		case .list:
			let ofType = schemaType.ofType
			let subFieldType = try parseType(schemaType: ofType, fieldName: fieldName)
			return .list(subFieldType)
		case .nonNull:
			let ofType = schemaType.ofType
			let subFieldType = try parseType(schemaType: ofType, fieldName: fieldName)
			return .nonNull(subFieldType)
		case .object:
			let nestedSelections = parsedSelections.pop()
			let nestedObject = IntermediateRepresentation.Object(graphQLTypeName: schemaType.name, selectionSet: nestedSelections)
			return .object(nestedObject)
		case .scalar:
			let name = schemaType.name
			if let scalar = scalars.first(where: { $0.graphType == name }) {
				return .scalar(scalar)
			} else {
				throw Error(description: "Unable to recognize scalar of type \(name)")
			}
		case .enum:
			return .enum(enumFromSchemaType(schemaType).name)
		case .interface:
			let nestedSelections = parsedSelections.pop()
			let nestedType = IntermediateRepresentation.Interface(graphQLTypeName: schemaType.name, selectionSet: nestedSelections)
			return .interface(nestedType)
		case .union:
			let nestedSelections = parsedSelections.pop()
			let nestedType = IntermediateRepresentation.Union(graphQLTypeName: schemaType.name, selectionSet: nestedSelections)
			return .union(nestedType)
		default:
			throw Error(description: "Field of type \(schemaType.kind) not supported")
		}
	}
	
	override func visitInlineFragment(inlineFragment: SwiftGraphQLParser.InlineFragment) {
		currentSelectionType.push(.inlineFragment)
		let typeCondition = schema.type(named: inlineFragment.typeCondition!.namedType)
		parentType.push(typeCondition)
		selectionContainsConditionalDirective.push(false)
	}
	
	override func exitInlineFragment(inlineFragment: SwiftGraphQLParser.InlineFragment) throws {
		let schemaType = parentType.pop()
		let typeCondition = try parseTypeCondition(from: schemaType)
		let nestedSelections = parsedSelections.pop()
		let hasConditionalDirective = selectionContainsConditionalDirective.pop()
		let inlineFragment = IntermediateRepresentation.InlineFragment(
			typeCondition: typeCondition,
			selectionSet: nestedSelections,
			hasConditionalDirective: hasConditionalDirective
		)
		var selections = parsedSelections.pop()
		selections.append(.inlineFragment(inlineFragment))
		parsedSelections.push(selections)
		currentSelectionType.pop()
	}
	
	override func visitFragmentSpread(fragmentSpread: SwiftGraphQLParser.FragmentSpread) throws {
		currentSelectionType.push(.fragmentSpread)
		selectionContainsConditionalDirective.push(false)
		guard fragments[fragmentSpread.fragmentName] != nil else {
			throw Error(description: "Referenced missing fragment of name \(fragmentSpread.fragmentName)")
		}
	}
	
	override func exitFragmentSpread(fragmentSpread: SwiftGraphQLParser.FragmentSpread) throws {
		let schemaType = parentType.peek()
		let typeCondition = try parseTypeCondition(from: schemaType)
		let hasConditionalDirective = selectionContainsConditionalDirective.pop()
		let fragmentSpread = IntermediateRepresentation.FragmentSpread(
			name: fragmentSpread.fragmentName,
			typeCondition: typeCondition,
			hasConditionalDirective: hasConditionalDirective
		)
		var selections = parsedSelections.pop()
		selections.append(.fragmentSpread(fragmentSpread))
		parsedSelections.push(selections)
		currentSelectionType.pop()
	}
	
	private func parseTypeCondition(from schemaType: Schema.SchemaType) throws -> IntermediateRepresentation.TypeCondition {
		let typeName = schemaType.name
		switch schemaType.kind {
		case .interface:
			return .interface(typeName)
		case .union:
			return .union(typeName)
		case .object:
			return .object(typeName)
		case .inputObject, .nonNull, .list, .scalar, .enum:
			throw Error(description: "Found inline fragment on non-supported type \(schemaType)")
		}
	}
	
	override func visitDirective(directive: SwiftGraphQLParser.Directive) throws {
		let name = directive.name
		if name == "skip" || name == "include" {
			_ = selectionContainsConditionalDirective.pop()
			selectionContainsConditionalDirective.push(true)
		}
	}
	
	override func visitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) {
		let typeName = fragmentDefinition.typeCondition.namedType
		let type = schema.type(named: typeName)
		parentType.push(type)
	}
	
	override func exitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) throws {
		let name = fragmentDefinition.fragmentName
		let schemaType = parentType.pop()
		let typeCondition = try parseTypeCondition(from: schemaType)
		let selections = parsedSelections.pop()
		let query = fragments[name]!
		let fragmentDefinition = IntermediateRepresentation.FragmentDefinition(name: name, typeCondition: typeCondition, selections: selections, query: query)
		fragmentDefinitions.append(fragmentDefinition)
	}
	
	override func visitVariable(variable: SwiftGraphQLParser.Variable) throws {
		guard isParsingVariableDeclaration == false else { return }
		var currentReferencedVariables = referencedVariables.pop()
		currentReferencedVariables.append(variable.name)
		referencedVariables.push(currentReferencedVariables)
	}
	
	override func exitNamedType(namedType: String) throws {
		guard self.isParsingVariableDeclaration else { return }
		let name = namedType
		let schemaType = schema.type(named: name)
		let type: IntermediateRepresentation.Variable.VariableType
		switch schemaType.kind {
		case .scalar:
			if let scalar = scalars.first(where: { $0.graphType == name }) {
				type = IntermediateRepresentation.Variable.VariableType.scalar(scalar)
			} else {
				throw Error(description: "Unable to recognize scalar of type \(name)")
			}
		case .inputObject:
			let inputFields = try parseInputFields(inputType: schemaType)
			let inputType = IntermediateRepresentation.InputType(
				name: schemaType.name,
				inputFields: inputFields,
				attributes: IntermediateRepresentation.Attributes(description: schemaType.description)
			)
			referencedInputTypes.insert(inputType)
			type = IntermediateRepresentation.Variable.VariableType.input(inputType.name)
		case .enum:
			let enumIR = enumFromSchemaType(schemaType)
			type = IntermediateRepresentation.Variable.VariableType.enum(enumIR.name)
		default:
			throw Error(description: "Encountered unexpected variable \(schemaType.name) of kind \(schemaType.kind)")
		}
		self.variableType = type
	}
	
	private func enumFromSchemaType(_ schemaType: Schema.SchemaType) -> IntermediateRepresentation.EnumType {
		let name = schemaType.name
		let topLevelType = schema.type(named: name)
		
		let enumValues = topLevelType.enumValues.sorted(by: { $0.name < $1.name }).map {
			return IntermediateRepresentation.EnumType.Value(
				value: $0.name,
				attributes: IntermediateRepresentation.Attributes(
					description: $0.description,
					isDeprecated: $0.isDeprecated,
					deprecationReason: $0.deprecationReason
				)
			)
		}
		
		let ir = IntermediateRepresentation.EnumType(
			name: name,
			values: enumValues,
			attributes: IntermediateRepresentation.Attributes(
				description: schemaType.description
			)
		)
		self.referencedEnums.insert(ir)
		
		return ir
	}
	
	override func exitListType(listType: Type) {
		guard self.isParsingVariableDeclaration else { return }
		let variableType = self.variableType!
		self.variableType = .list(variableType)
	}
	
	override func exitNonNullType(nonNullType: Type) {
		guard self.isParsingVariableDeclaration else { return }
		let variableType = self.variableType!
		self.variableType = .nonNull(variableType)
	}
	
	private func parseInputFields(inputType: Schema.SchemaType) throws -> [IntermediateRepresentation.Variable] {
		func parse(inputFieldType: Schema.SchemaType) throws -> IntermediateRepresentation.Variable.VariableType {
			switch inputFieldType.kind {
			case .list:
				let ofType = inputFieldType.ofType
				let nestedType = try parse(inputFieldType: ofType)
				return IntermediateRepresentation.Variable.VariableType.list(nestedType)
			case .nonNull:
				let ofType = inputFieldType.ofType
				let nestedType = try parse(inputFieldType: ofType)
				return IntermediateRepresentation.Variable.VariableType.nonNull(nestedType)
			case .scalar:
				let name = inputFieldType.name
				if let scalar = scalars.first(where: { $0.graphType == name }) {
					return IntermediateRepresentation.Variable.VariableType.scalar(scalar)
				} else {
					throw Error(description: "Failed to find scalar type for GraphQL scalar \(name)")
				}
			case .inputObject:
				let name = inputFieldType.name
				let topLevelType = schema.type(named: name)
				let inputFields = try self.parseInputFields(inputType: topLevelType)
				let nestedInputType = IntermediateRepresentation.InputType(
					name: name,
					inputFields: inputFields,
					attributes: IntermediateRepresentation.Attributes(description: inputFieldType.description)
				)
				referencedInputTypes.insert(nestedInputType)
				return IntermediateRepresentation.Variable.VariableType.input(nestedInputType.name)
			case .enum:
				let enumIR = enumFromSchemaType(inputFieldType)
				return IntermediateRepresentation.Variable.VariableType.enum(enumIR.name)
			default:
				throw Error(description: "Encountered unexpected type on Input Object \(inputType)")
			}
		}
		var inputFields: [IntermediateRepresentation.Variable] = []
		for field in inputType.inputFields {
			let inputFieldType = try parse(inputFieldType: field.type)
			inputFields.append(IntermediateRepresentation.Variable(name: field.name, type: inputFieldType))
		}
		return inputFields
	}

	private class func mergeScalarTypes(customScalars: [ScalarType], builtInScalars: TemplateSpec.BuiltInScalars) -> [ScalarType] {
		var builtInScalars = builtInScalars.scalars
		customScalars.forEach { builtInScalars.removeValue(forKey: $0.graphType) }
		let filteredScalars = builtInScalars.map { key, value -> ScalarType in IntermediateRepresentation.CustomScalar(graphType: key, nativeType: value) }
		return customScalars + filteredScalars
	}
}
