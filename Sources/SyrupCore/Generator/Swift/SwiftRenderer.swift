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
import Stencil
import PathKit

final class SwiftRenderer: Renderer {
	override class func customExtensions(config: Config) -> [Extension] {
		return [
			SwiftRenderer.customExtension(config: config),
			SwiftNestedRendererExtension(config: config),
			ReservedWordsExtension(reservedWords: config.template.specification.reservedWords),
			ArgumentRendererExtension<SwiftVariableTypeRenderer>(
				reservedWords: config.template.specification.reservedWords,
				null: config.template.specification.nullString),
			TypeAnnotationExtension(moduleName: config.project.moduleName),
			SelectionSetExtension()
		]
	}
	
	func renderFragmentDefinitions(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [String] {
		var rendered: [String] = []
		for fragment in intermediateRepresentation.fragmentDefinitions {
			let collectionResults = try intermediateRepresentation.collectFields(for: fragment)
			let fields = collectionResults.fields.scopedTo(parentFragment: fragment.name)
			
			var definition = ""
			if case .interface(let interfaceType) = fragment.typeCondition {
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: collectionResults.fragmentSpreads, inheritedType: interfaceType)
				let computedFragmentFields = collectionResults.fields.computedFragmentFields(fragmentSpreads: groupedFragmentSpreads[interfaceType]!, parentType: fragment.typeCondition.name)
				
				definition += try renderInterfaceWrapper(name: fragment.name, interfaceTypeName: interfaceType, collectedFields: collectionResults.fields, scopedFields: fields, computedFragmentFields: computedFragmentFields, groupedFragmentSpreads: groupedFragmentSpreads, asFile: true)
			} else if case .union(let unionTypeName) = fragment.typeCondition {
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: collectionResults.fragmentSpreads, inheritedType: unionTypeName)
				
				definition += try renderUnionWrapper(name: fragment.name, unionTypeName: unionTypeName, collectedFields: fields, groupedFragmentSpreads: groupedFragmentSpreads, asFile: true)
			} else {
				let fragmentSpreads = IntermediateRepresentation.fragments(from: collectionResults.fragmentSpreads, onConcreteType: fragment.typeCondition.name)
				let computedFragmentFields = collectionResults.fields.computedFragmentFields(fragmentSpreads: fragmentSpreads, parentType: fragment.typeCondition.name)
				definition += try renderConcreteFragment(name: fragment.name, graphQLName: fragment.typeCondition.name, fields: fields, computedFragmentFields: computedFragmentFields, fragmentSpreads: fragmentSpreads, asFile: true)
			}
			if config.project.generateSelections {
				let fragmentSelections = selectionSets.fragmentDefinition(named: fragment.name)
				definition += try renderFragmentSelections(fragmentSelections)
			}
			
			rendered.append(definition)
		}
		return rendered
	}
	
	func renderResponseTypes(intermediateRepresentation: IntermediateRepresentation) throws -> [String] {
		var rendered: [String] = []
		for operation in intermediateRepresentation.operations {
			let name = "\(operation.name)Response"
			let graphQLName: String = operation.typeName
			let collectionResults = try intermediateRepresentation.collectFields(for: operation)
			let collectedFields = collectionResults.fields
			let fields = collectedFields.scopedTo(parentFragment: nil)
			let fragmentSpreads = IntermediateRepresentation.fragments(from: collectionResults.fragmentSpreads, onConcreteType: operation.typeName)
			let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
			let computedFragmentFields = collectedFields.computedFragmentFields(fragmentSpreads: fragmentSpreads, parentType: graphQLName)
			rendered.append(try renderResponseType(name: name, graphQLName: graphQLName, fields: fields, fragmentSpreads: fragmentSpreads, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars, asFile: true
				))
		}
		return rendered
	}
	
	override func renderQuery(query: IntermediateRepresentation.OperationDefinition, intermediateRepresentation: IntermediateRepresentation, querySelections: SelectionSetVisitor.Operation) throws -> String {
		var renderedQuery = try super.renderQuery(query: query, intermediateRepresentation: intermediateRepresentation, querySelections: querySelections)
		renderedQuery += try renderQuerySelections(querySelections, enabled: config.project.generateSelections)
		return renderedQuery
	}
	
	override func renderMutation(mutation: IntermediateRepresentation.OperationDefinition, intermediateRepresentation: IntermediateRepresentation, mutationSelections: SelectionSetVisitor.Operation) throws -> String {
		var renderedMutation = try super.renderMutation(mutation: mutation, intermediateRepresentation: intermediateRepresentation, mutationSelections: mutationSelections)
		renderedMutation += try renderQuerySelections(mutationSelections, enabled: config.project.generateSelections)
		return renderedMutation
	}
	
	func renderCustomScalarResolver(customScalars: [IntermediateRepresentation.CustomCodedScalar]) throws -> String {
		let context: [String: Any] = [
			"scalars": customScalars
		]
		return try render(template: "CustomScalarResolver", asFile: true, context: context)
	}
		
	func renderGraphApi() throws -> String {
		return try render(template: "GraphApi", context: [:])
	}
	
	func renderModuleDefinition(moduleName: String, hasCustomCodedScalars: Bool) throws -> String {
		let context: [String: Any] = [
			"moduleName": config.project.moduleName,
			"hasCustomCodedScalars": hasCustomCodedScalars
		]
		return try render(template: "Module", asFile: true, context: context)
	}
	
	func renderResponseType(name: String, graphQLName: String, fields: [CollectedField], fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment], computedFragmentFields: [CollectedField], requiresCustomCoder: Bool, asFile: Bool = false) throws -> String {
		let context: [String: Any] = [
			"name": name,
			"graphQLName": graphQLName,
			"fields": fields,
			"computedFragmentFields": computedFragmentFields,
			"fragmentSpreads": fragmentSpreads,
			"requiresCustomCoder": requiresCustomCoder,
			]
		return try render(template: "ResponseType", asFile: asFile, context: context)
	}
	
	private func renderConcreteFragment(name: String, graphQLName: String, fields: [CollectedField], computedFragmentFields: [CollectedField], fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment], asFile: Bool) throws -> String {
		let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
		return try renderResponseType(name: name, graphQLName: graphQLName, fields: fields, fragmentSpreads: fragmentSpreads, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars, asFile: asFile)
	}
	
	private func renderFragmentSelections(_ fragmentDefinition: SelectionSetVisitor.FragmentDefinition) throws -> String {
		let context: [String: Any] = ["fragment": fragmentDefinition]
		return try render(template: "FragmentSelections", context: context)
	}
	
	private func renderQuerySelections(_ operation: SelectionSetVisitor.Operation, enabled: Bool) throws -> String {
		let operationSuffix: String
		switch operation.type {
		case .query:
			operationSuffix = "Query"
		case .mutation:
			operationSuffix = "Mutation"
		}
		let context: [String: Any] = ["operation": operation, "suffix": operationSuffix, "enabled": enabled]
		return try render(template: "OperationSelections", context: context)
	}
	
	func renderInterfaceWrapper(name: String, interfaceTypeName: String, collectedFields: [CollectedField], scopedFields: [CollectedField], computedFragmentFields: [CollectedField], groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], asFile: Bool = false) throws -> String {
		let groupedFields = try scopedFields.groupedFields(fromInterfaceType: interfaceTypeName)
		let baseFields = scopedFields.baseFields(fromInterfaceType: interfaceTypeName)
		var concreteTypeNames = groupedFields.map { $0.key }
		concreteTypeNames.append(contentsOf: groupedFragmentSpreads.keys.filter { $0 != interfaceTypeName })
		concreteTypeNames = concreteTypeNames.unique.sorted()
		var groupedComputedFragmentFields: [String: [CollectedField]] = [:]
		for concreteType in concreteTypeNames {
			var fragmentSpreads = groupedFragmentSpreads[concreteType] ?? []
			fragmentSpreads.append(contentsOf: groupedFragmentSpreads[interfaceTypeName] ?? [])
			groupedComputedFragmentFields[concreteType] = collectedFields.computedFragmentFields(fragmentSpreads: fragmentSpreads, parentTypes: [concreteType, interfaceTypeName])
		}
		groupedComputedFragmentFields[interfaceTypeName] = collectedFields.computedFragmentFields(fragmentSpreads: groupedFragmentSpreads[interfaceTypeName] ?? [], parentTypes: [interfaceTypeName])
		let fallbackTypeName = "Base\(interfaceTypeName)"
		let fragmentSpreads = groupedFragmentSpreads[interfaceTypeName]!
		let context: [String: Any] = [
			"name": name,
			"interfaceTypeName": interfaceTypeName,
			"concreteTypeNames": concreteTypeNames,
			"fallbackTypeName": fallbackTypeName,
			"fragmentSpreads": fragmentSpreads,
			"groupedFragmentSpreads": groupedFragmentSpreads,
			"baseFields": baseFields,
			"collectedFields": scopedFields,
			"computedFragmentFields": computedFragmentFields,
			"groupedComputedFragmentFields": groupedComputedFragmentFields
		]
		return try render(template: "InterfaceWrapper", asFile: asFile, context: context)
	}
	
	func renderInterfaceWrapper(field: IntermediateRepresentation.CollectedInterfaceField) throws -> String {
		let name = field.name.capitalizedFirstLetter
		
		let interfaceType = field.type.graphQLName
		let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: field.fragmentSpreads, inheritedType: interfaceType)
		let scopedFields = field.collectedFields.scopedTo(parentFragment: field.parentFragment?.name)
		let computedFragmentFields = field.collectedFields.computedFragmentFields(fragmentSpreads: groupedFragmentSpreads[interfaceType] ?? [], parentType: interfaceType)
		return try renderInterfaceWrapper(name: name, interfaceTypeName: field.type.graphQLName, collectedFields: field.collectedFields, scopedFields: scopedFields, computedFragmentFields: computedFragmentFields, groupedFragmentSpreads: groupedFragmentSpreads)
	}
	
	func renderUnionWrapper(name: String, unionTypeName: String, collectedFields: [CollectedField], groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], asFile: Bool = false) throws -> String {
		let groupedFields = collectedFields.groupedFields(fromUnionType: unionTypeName)
		var concreteTypeNames = groupedFields.map { $0.key }
		concreteTypeNames.append(contentsOf: groupedFragmentSpreads.keys.filter { $0 != unionTypeName })
		concreteTypeNames = concreteTypeNames.unique.sorted()
		let fragmentSpreads = groupedFragmentSpreads[unionTypeName] ?? []
		
		let context: [String: Any] = [
			"name": name,
			"unionTypeName": unionTypeName,
			"concreteTypeNames": concreteTypeNames,
			"fragmentSpreads": fragmentSpreads,
			"groupedFragmentSpreads": groupedFragmentSpreads,
			"collectedFields": collectedFields,
			]
		return try render(template: "UnionWrapper", asFile: asFile, context: context)
	}
	
	func renderUnionWrapper(field: IntermediateRepresentation.CollectedUnionField) throws -> String {
		let name = field.name.capitalizedFirstLetter
		let unionTypeName = field.type.graphQLName
		let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: field.fragmentSpreads, inheritedType: unionTypeName)
		let collectedFields = field.collectedFields.scopedTo(parentFragment: field.parentFragment?.name)
		
		return try renderUnionWrapper(name: name, unionTypeName: field.type.graphQLName, collectedFields: collectedFields, groupedFragmentSpreads: groupedFragmentSpreads)
	}
	
	private static func customExtension(config: Config) -> Extension {
		let customExtension = Extension()
		
		customExtension.registerFilter("renderInterfaceWrapperTypeAlias", filter: { value, args -> Any? in
			guard let field = value as? CollectedField, let accessLevel = args.first as? String else { return nil }
			
			switch field {
			case is IntermediateRepresentation.CollectedObjectField,
				 is IntermediateRepresentation.CollectedUnionField:
				return "\(accessLevel) typealias \(field.name.capitalizedFirstLetter) = Base\(field.parentType.capitalizedFirstLetter).\(field.name.capitalizedFirstLetter)"
				
			default:
				// Other fields will be declared as top-level types and do not need typealiases
				return nil
			}
		})
		
		customExtension.registerFilter("renderPropertyDeclaration") { value -> Any? in
			if let field = value as? IntermediateRepresentation.CollectedObjectField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(objectField: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedScalarField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(scalarField: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(interfaceWrapper: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(unionWrapper: field))"
			}
			return nil
		}
		
		customExtension.registerFilter("renderType") { value -> Any? in
			if let field = value as? IntermediateRepresentation.CollectedObjectField {
				return SwiftTypeAnnotationRenderer.render(objectField: field)
			} else if let field = value as? IntermediateRepresentation.CollectedScalarField {
				return SwiftTypeAnnotationRenderer.render(scalarField: field)
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				return SwiftTypeAnnotationRenderer.render(interfaceWrapper: field)
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				return SwiftTypeAnnotationRenderer.render(unionWrapper: field)
			}
			return nil
		}
		
		customExtension.registerFilter("decodeField") { (value) -> Any? in
			guard let field = value as? CollectedField else { return nil }
			let fieldName: String
			let typeAnnotation: String
			if let scalarField = field as? IntermediateRepresentation.CollectedScalarField {
				typeAnnotation = SwiftTypeAnnotationRenderer.render(scalarField: scalarField)
				fieldName = field.name
			} else if let objectField = field as? IntermediateRepresentation.CollectedObjectField {
				typeAnnotation = SwiftTypeAnnotationRenderer.render(objectField: objectField)
				fieldName = field.name
			} else if let interfaceField = field as? IntermediateRepresentation.CollectedInterfaceField {
				typeAnnotation = SwiftTypeAnnotationRenderer.render(interfaceWrapper: interfaceField)
				fieldName = field.name
			} else if let unionField = field as? IntermediateRepresentation.CollectedUnionField {
				typeAnnotation = SwiftTypeAnnotationRenderer.render(unionWrapper: unionField)
				fieldName = field.name
			} else {
				fatalError("Unable to determine type annotation \(field)")
			}
			if let customCodedScalar = field.type.nestedScalar as? IntermediateRepresentation.CustomCodedScalar {
				return """
				self.\(fieldName) = try customScalarResolver.decode(\(typeAnnotation).self, rawValueType: \(customCodedScalar.rawValueType).self, forKey: .\(field.name), container: container) { (value) -> \(customCodedScalar.nativeType) in
				return try customScalarResolver.decoderFor\(customCodedScalar.graphType)(value, container.codingPath)
				}
				"""
			}
			
			if field.type.isNonNull {
				return """
				self.\(fieldName) = try container.decode(\(typeAnnotation).self, forKey: .\(field.name))
				"""
			} else {
				return """
				self.\(fieldName) = try container.decodeIfPresent(\(typeAnnotation.removeSuffix("?")).self, forKey: .\(field.name))
				"""
			}
		}
		
		customExtension.registerFilter("requiresNestedTypeDefinitions") { (value, args) -> Any? in
			guard let fields = value as? [CollectedField] else { return nil }
			for field in fields {
				if field is IntermediateRepresentation.CollectedObjectField {
					return true
				} else if field is IntermediateRepresentation.CollectedInterfaceField {
					return true
				} else if field is IntermediateRepresentation.CollectedUnionField {
					return true
				}
			}
			return false
		}
		
		customExtension.registerFilter("renderVariableType") { (value) -> Any? in
			guard let variableType = value as? IntermediateRepresentation.Variable.VariableType else { return nil }
			return SwiftVariableTypeRenderer.render(variableType: variableType)
		}
		
		customExtension.registerFilter("renderResolverArguments") { (value) -> Any? in
			guard let scalars = value as? [IntermediateRepresentation.CustomCodedScalar] else { return nil }
			return scalars.map {
				"decoderFor\($0.graphType): @escaping (\($0.rawValueType)) throws -> \($0.nativeType), encoderFor\($0.graphType): @escaping (\($0.nativeType)) throws -> \($0.rawValueType)"
				}.joined(separator: ", ")
		}
		
		customExtension.registerFilter("renderInputVariableType") { (value) -> Any? in
			guard let variableType = value as? IntermediateRepresentation.Variable.VariableType else { return nil }
			return SwiftVariableTypeRenderer.render(inputVariableType: variableType)
		}
				
		customExtension.registerFilter("customCodedScalarResolvers") { (value) -> Any? in
			guard let scalars = value as? [IntermediateRepresentation.CustomCodedScalar] else { return nil }
			return scalars.map { scalar in
				let graphType = scalar.graphType
				return "decoderFor\(graphType): resolverFor\(graphType).decoder, encoderFor\(graphType): resolverFor\(graphType).encoder"
				}.joined(separator: ", ")
		}
		return customExtension
	}
}
