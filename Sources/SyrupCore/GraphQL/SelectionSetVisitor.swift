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

class SelectionSetVisitor: GraphQLBaseVisitor {
	private let schema: Schema
	private(set) var operations: [Operation] = []
	private(set) var fragmentDefinitions: [FragmentDefinition] = []
	private var currentSelectionSet: Stack<[Selection]> = []
	private var currentParentType: Stack<Schema.SchemaType> = []
	private var currentArgumentValue: Stack<[ArgumentValueType]> = []
	private var currentObjectFields: Stack<[ObjectField]> = []
	private var parsingDirectiveArguments: Bool = false
	private var currentArguments: Stack<[Argument]> = []
	private var currentDirectiveValues: Stack<ConditionalDirective> = []
	private var isParsingVariableDefinition: Bool = false

	struct Results {
		let operations: [Operation]
		let fragmentDefinitions: [FragmentDefinition]

		func fragmentDefinition(named: String) -> FragmentDefinition {
			fragmentDefinitions.first(where: { $0.name == named })!
		}

		func operation(named: String) -> Operation {
			operations.first(where: { $0.name == named })!
		}
	}
	var results: Results {
		Results(operations: operations, fragmentDefinitions: fragmentDefinitions)
	}

	init(schema: Schema) {
		self.schema = schema
		super.init()
	}

	override func visitOperation(operation: SwiftGraphQLParser.Operation) throws {
		let parentType: Schema.SchemaType
		switch operation.operationType {
		case .query:
			parentType = schema.queryType
		case .mutation:
			parentType = schema.mutationType!
		case .subscription:
			parentType = schema.subscriptionType!
		}
		self.currentParentType.push(parentType)
	}

	override func exitOperation(operation: SwiftGraphQLParser.Operation) throws {
		let operationType: OperationType
		switch operation.operationType {
		case .query:
			operationType = .query(schema.queryType.name)
		case .mutation:
			operationType = .mutation(schema.mutationType!.name)
		case .subscription:
			operationType = .subscription(schema.subscriptionType!.name)
		}
		let selections = self.currentSelectionSet.peek()
		let operation = Operation(
			name: operation.name!,
			type: operationType,
			selectionSet: selections
		)
		self.operations.append(operation)
		self.currentParentType.pop()
		self.currentSelectionSet.pop()
	}

	override func visitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) throws {
		let parentType = schema.type(named: fragmentDefinition.typeCondition.namedType)
		self.currentParentType.push(parentType)
	}

	override func exitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) throws {
		let typeCondition = parseTypeCondition(from: self.currentParentType.peek().name)
		let selections = self.currentSelectionSet.peek()
		let fragmentDefinition = FragmentDefinition(
			name: fragmentDefinition.fragmentName,
			typeCondition: typeCondition,
			selectionSet: selections
		)
		self.fragmentDefinitions.append(fragmentDefinition)
		self.currentSelectionSet.pop()
		self.currentParentType.pop()
	}

	override func visitSelectionSet(selectionSet: [SwiftGraphQLParser.Selection]) throws {
		self.currentSelectionSet.push([])
	}

	override func visitField(field: SwiftGraphQLParser.Field) throws {
		if (field.selectionSet?.count ?? 0) > 0 {
			let parentType = schema.topLevelType(of: field.name, on: self.currentParentType.peek())
			self.currentParentType.push(parentType)
		}
		if field.arguments.count > 0 {
			currentArguments.push([])
			parsingDirectiveArguments = false
		}
	}

	override func exitField(field: SwiftGraphQLParser.Field) throws {
		if (field.selectionSet?.count ?? 0) > 0 {
			self.currentParentType.pop()
		}
		let arguments: [Argument]
		if field.arguments.count > 0 {
			arguments = currentArguments.pop()
		} else {
			arguments = []
		}
		let conditionalDirective: ConditionalDirective?
		if field.directives.count > 0 {
			conditionalDirective = currentDirectiveValues.pop()
		} else {
			conditionalDirective = nil
		}

		let parentType = parseTypeCondition(from: self.currentParentType.peek().name)
		let type: TypeCondition
		if field.name == IntermediateRepresentation.typeNameField {
			type = TypeCondition.scalar("String")
		} else {
			type = parseTypeCondition(from:
				schema.topLevelType(
					of: field.name,
					on: self.currentParentType.peek()
					).name
			)

		}
		let nestedSelections: [Selection]
		switch type {
		case .scalar:
			nestedSelections = []
		default:
			nestedSelections = currentSelectionSet.pop()
		}
				
		let parsedField = Field(
			name: field.name,
			alias: field.alias,
			conditionalDirective: conditionalDirective,
			arguments: arguments,
			selectionSet: nestedSelections,
			parentType: parentType,
			type: type
		)
		self.currentSelectionSet.transformTopElement { (selections) in
			selections.append(.field(parsedField))
		}
	}

	override func exitFragmentSpread(fragmentSpread: SwiftGraphQLParser.FragmentSpread) throws {
		let conditionalDirective: ConditionalDirective?
		if fragmentSpread.directives.count > 0 {
			conditionalDirective = currentDirectiveValues.pop()
		} else {
			conditionalDirective = nil
		}
		let parsedFragmentSpread = FragmentSpread(name: fragmentSpread.fragmentName, conditionalDirective: conditionalDirective)
		self.currentSelectionSet.transformTopElement { (selections) in
			selections.append(.fragmentSpread(parsedFragmentSpread))
		}
	}

	override func visitInlineFragment(inlineFragment: SwiftGraphQLParser.InlineFragment) throws {
		let parentType = schema.type(named: inlineFragment.typeCondition!.namedType)
		currentParentType.push(parentType)
	}

	override func exitInlineFragment(inlineFragment: SwiftGraphQLParser.InlineFragment) throws {
		let parentType = parseTypeCondition(from: self.currentParentType.peek().name)
		let conditionalDirective: ConditionalDirective?
		if inlineFragment.directives.count > 0 {
			conditionalDirective = currentDirectiveValues.pop()
		} else {
			conditionalDirective = nil
		}
		let parsedInlineFragment = InlineFragment(
			typeCondition: parentType,
			selectionSet: currentSelectionSet.pop(),
			conditionalDirective: conditionalDirective
		)
		self.currentSelectionSet.transformTopElement { (selections) in
			selections.append(.inlineFragment(parsedInlineFragment))
		}

		currentParentType.pop()
	}

	override func visitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) throws {
		isParsingVariableDefinition = true
	}

	override func exitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) throws {
		isParsingVariableDefinition = false
	}

	override func visitArgument(argument: SwiftGraphQLParser.Argument) throws {
		currentArgumentValue.push([])
	}

	override func exitArgument(argument: SwiftGraphQLParser.Argument) throws {
		if parsingDirectiveArguments == false {
			let value = currentArgumentValue.pop().first!
			currentArguments.transformTopElement { (arguments) in
				arguments.append(Argument(name: argument.name, value: value))
			}
		}
	}

	override func visitDirective(directive: SwiftGraphQLParser.Directive) throws {
		parsingDirectiveArguments = true
	}

	override func exitDirective(directive: SwiftGraphQLParser.Directive) throws {
		parsingDirectiveArguments = false
		let value = currentArgumentValue.pop().first!
		switch directive.name {
		case "skip":
			currentDirectiveValues.push(ConditionalDirective.skip(value))
		case "include":
			currentDirectiveValues.push(ConditionalDirective.include(value))
		default:
			fatalError("Encountered unexpected directive \(directive.name)")
		}
	}

	override func visitVariable(variable: SwiftGraphQLParser.Variable) throws {

	}

	override func exitVariable(variable: SwiftGraphQLParser.Variable) throws {
		guard isParsingVariableDefinition == false else {
			return
		}
		currentArgumentValue.transformTopElement { (values) in
			values.append(Variable(name: variable.name))
		}
	}

	override func visitValue(value: SwiftGraphQLParser.Value) throws {

	}

	override func visitIntValue(intValue: String) throws {

	}

	override func exitIntValue(intValue: String) throws {
		currentArgumentValue.transformTopElement({ (values) in
			values.append(IntValue(value: Int(intValue)!))
		})
	}

	override func visitStringValue(stringValue: SwiftGraphQLParser.StringValue) throws {

	}

	override func exitStringValue(stringValue: SwiftGraphQLParser.StringValue) throws {
		currentArgumentValue.transformTopElement { (values) in
			switch stringValue {
			case .singleQuote(let val):
				values.append(StringValue(singleQuote: val))
			case  .blockQuote(let val):
				values.append(StringValue(blockQuote: val))
			}
		}
	}

	override func visitBooleanValue(booleanValue: Bool) throws {

	}

	override func exitBooleanValue(booleanValue: Bool) throws {
		currentArgumentValue.transformTopElement { (values) in
			values.append(BooleanValue(value: booleanValue))
		}
	}

	override func visitNullValue() throws {

	}

	override func exitNullValue() throws {
		currentArgumentValue.transformTopElement { (values) in
			values.append(NullValue())
		}
	}

	override func visitEnumValue(enumValue: String) throws {

	}

	override func exitEnumValue(enumValue: String) throws {
		currentArgumentValue.transformTopElement { (values) in
			values.append(EnumValue(value: enumValue))
		}
	}

	override func visitListValue(listValue: [SwiftGraphQLParser.Value]) throws {
		currentArgumentValue.push([])
	}

	override func exitListValue(listValue: [SwiftGraphQLParser.Value]) throws {
		let listItems = currentArgumentValue.pop()
		currentArgumentValue.transformTopElement { (values) in
			values.append(ListValue(values: listItems))
		}
	}

	override func visitObjectValue(objectValue: [SwiftGraphQLParser.ObjectField]) throws {
		currentObjectFields.push([])
	}

	override func exitObjectValue(objectValue: [SwiftGraphQLParser.ObjectField]) throws {
		let objectFields = currentObjectFields.pop()
		currentArgumentValue.transformTopElement { (values) in
			values.append(ObjectValue(objectFields: objectFields))
		}
	}

	override func visitObjectField(objectField: SwiftGraphQLParser.ObjectField) throws {
		currentArgumentValue.push([])
	}

	override func exitObjectField(objectField: SwiftGraphQLParser.ObjectField) throws {
		let value = currentArgumentValue.pop().first!
		currentObjectFields.transformTopElement { (fields) in
			fields.append(ObjectField(name: objectField.name, value: value))
		}
	}
}

extension SelectionSetVisitor {
	fileprivate func parseTypeCondition(from type: String) -> TypeCondition {
		let schemaType = schema.type(named: type)
		if schemaType.isObjectType() {
			return .object(type)
		} else if schemaType.isInterfaceType() {
			return .interface(type)
		} else if schemaType.isUnionType() {
			return .union(type)
		} else {
			return .scalar(type)
		}
	}
}

extension SelectionSetVisitor {
	struct Operation {
		let name: String
		let type: OperationType
		let selectionSet: [Selection]
	}

	enum OperationType {
		case mutation(String)
		case query(String)
		case subscription(String)

		var name: String {
			switch self {
			case .mutation(let name), .query(let name), .subscription(let name):
				return name
			}
		}
	}

	struct Selection {
		let field: Field?
		let fragmentSpread: FragmentSpread?
		let inlineFragment: InlineFragment?

		static func field(_ field: Field) -> Selection {
			Selection(field: field)
		}

		static func fragmentSpread(_ fragmentSpread: FragmentSpread) -> Selection {
			Selection(fragmentSpread: fragmentSpread)
		}

		static func inlineFragment(_ inlineFragment: InlineFragment) -> Selection {
			Selection(inlineFragment: inlineFragment)
		}

		private init(field: Field? = nil, fragmentSpread: FragmentSpread? = nil, inlineFragment: InlineFragment? = nil) {
			self.field = field
			self.fragmentSpread = fragmentSpread
			self.inlineFragment = inlineFragment
		}
	}

	struct Field {
		let name: String
		let alias: String?
		let conditionalDirective: ConditionalDirective?
		let arguments: [Argument]
		let selectionSet: [Selection]
		let parentType: TypeCondition
		let type: TypeCondition
	}

	struct ConditionalDirective {
		let skip: ArgumentValueType?
		let include: ArgumentValueType?

		static func skip(_ value: ArgumentValueType) -> ConditionalDirective {
			ConditionalDirective(skip: value)
		}

		static func include(_ value: ArgumentValueType) -> ConditionalDirective {
			ConditionalDirective(include: value)
		}

		private init(skip: ArgumentValueType? = nil, include: ArgumentValueType? = nil) {
			self.skip = skip
			self.include = include
		}
	}

	struct Argument {
		let name: String
		let value: ArgumentValueType
	}

	struct FragmentSpread {
		let name: String
		let conditionalDirective: ConditionalDirective?
	}

	struct FragmentDefinition {
		let name: String
		let typeCondition: TypeCondition
		let selectionSet: [Selection]
	}

	struct InlineFragment {
		let typeCondition: TypeCondition
		let selectionSet: [Selection]
		let conditionalDirective: ConditionalDirective?
	}

	enum TypeCondition {
		case object(String)
		case interface(String)
		case union(String)
		case scalar(String)
	}

	struct Variable: ArgumentValueType {
		let name: String
	}

	struct IntValue: ArgumentValueType {
		let value: Int
	}

	struct FloatValue: ArgumentValueType {
		let value: Float
	}

	struct StringValue: ArgumentValueType {
		let value: String
		let blockQuote: Bool

		init(blockQuote: String) {
			self.value = blockQuote
			self.blockQuote = true
		}

		init(singleQuote: String) {
			self.value = singleQuote
			self.blockQuote = false
		}
	}

	struct BooleanValue: ArgumentValueType {
		let value: Bool
	}

	struct NullValue: ArgumentValueType {

	}

	struct EnumValue: ArgumentValueType {
		let value: String
	}

	struct ListValue: ArgumentValueType {
		let values: [ArgumentValueType]
	}

	struct ObjectValue: ArgumentValueType {
		let objectFields: [ObjectField]
	}

	struct ObjectField {
		let name: String
		let value: ArgumentValueType
	}
}

protocol ArgumentValueType {}
