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

final class TypeScriptRenderer: Renderer {
	override class func customExtensions(config: Config) -> [Extension] {
		[
			TypeScriptRenderer.customExtension(),
			ReservedWordsExtension(reservedWords: config.template.specification.reservedWords),
			ArgumentRendererExtension<TypeScriptVariableTypeRenderer>(
				reservedWords: config.template.specification.reservedWords,
				null: config.template.specification.nullString),
			TypeScriptInternalRendererExtension(config: config),
			SelectionSetExtension()
		]
	}
	
	override func renderOperation(
		operation: IntermediateRepresentation.OperationDefinition,
		intermediateRepresentation: IntermediateRepresentation,
		operationSelections: SelectionSetVisitor.Operation
	) throws -> String {
		let queryString = intermediateRepresentation.fullQueryString(for: operation).removingLeadingSpaces.removingNewLines
		let referencedImportsForOperation = referencedImports(
			selections: operation.selections,
			intermediateRepresentation: intermediateRepresentation,
			variables: operation.variables
		)
		let collectionResults = try intermediateRepresentation.collectFields(for: operation)
		let fields = collectionResults.fields.scopedTo(parentFragment: nil)
		let topLevelFragmentSpreads = IntermediateRepresentation.fragments(from: collectionResults.fragmentSpreads, onConcreteType: operation.typeName)
		let operationTypeName = "\(operation.type)".capitalized
		let name = "\(operation.name)\(operationTypeName)Data"
		
		let context: [String: Any] = [
			"operation": operation,
			"name": name,
			"queryString": queryString,
			"fields": fields,
			"topLevelFragmentNames": topLevelFragmentSpreads.map { $0.name },
			"allReferencedFragments": referencedImportsForOperation.fragments,
			"allReferencedEnums": referencedImportsForOperation.enums,
			"allReferencedInputTypes": referencedImportsForOperation.inputs,
			"selections": operationSelections.selectionSet
		]
		
		return try render(template: "Operation", asFile: true, context: context)
	}
	
	func renderObjectFragment(
		fragment: SelectionSetVisitor.FragmentDefinition,
		typeName: String,
		fields: [CollectedField],
		fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment],
		referencedImports: (fragments: [String], enums: [String])
	) throws -> String {
		try render(template: "ObjectFragment", asFile: true, context: buildObjectContext(
			name: fragment.name,
			typeName: typeName,
			fields: fields,
			fragmentSpreads: fragmentSpreads,
			extras: [
				"isFragment": true,
				"allReferencedFragments": referencedImports.fragments,
				"allReferencedEnums": referencedImports.enums,
				"selections": fragment.selectionSet
			]
		))
	}
	
	func renderUnionFragment(
		fragment: SelectionSetVisitor.FragmentDefinition,
		typeName: String,
		commonFields: [CollectedField],
		collectedFields: [CollectedField],
		groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]],
		referencedImports: (fragments: [String], enums: [String])
	) throws -> String {
		try render(template: "UnionFragment", asFile: false, context: buildUnionContext(
			name: fragment.name,
			typeName: typeName,
			parentFragment: fragment.name,
			commonFields: commonFields,
			collectedFields: collectedFields,
			groupedFragmentSpreads: groupedFragmentSpreads,
			extras: [
				"isFragment": true,
				"allReferencedFragments": referencedImports.fragments,
				"allReferencedEnums": referencedImports.enums,
				"selections": fragment.selectionSet
			]
		))
	}
	
	override func renderInputTypes(intermediateRepresentation: IntermediateRepresentation) throws -> [String] {
		var rendered: [String] = []
		
		for inputType in intermediateRepresentation.referencedInputTypes {
			var inputImports: [String] = []
			var enumImports: [String] = []
			
			for inputField in inputType.inputFields {
				addEnumAndInputImportIfFound(variableType: inputField.type, &inputImports, &enumImports)
			}
			
			let context: [String: Any] = [
				"inputType": inputType,
				"inputImports": inputImports,
				"enumImports": enumImports
			]
			rendered.append(try render(template: "InputType", asFile: true, context: context))
		}
		return rendered
	}
	
	func renderObjectField(
		name: String,
		typeName: String,
		fields: [CollectedField],
		fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]
	) throws -> String {
		try render(template: "ObjectField", asFile: false, context: buildObjectContext(
			name: name,
			typeName: typeName,
			fields: fields,
			fragmentSpreads: fragmentSpreads,
			extras: [:]
		))
	}
	
	func renderUnionableField(
		fieldName: String,
		typeName: String,
		parentFragment: String?,
		commonFields: [CollectedField],
		collectedFields: [CollectedField],
		groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]]
	) throws -> String {
		try render(template: "UnionField", asFile: false, context: buildUnionContext(
			name: fieldName,
			typeName: typeName,
			parentFragment: parentFragment,
			commonFields: commonFields,
			collectedFields: collectedFields,
			groupedFragmentSpreads: groupedFragmentSpreads,
			extras: [:]
		))
	}
	
	func renderFragmentDefinitions(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [String] {
		var rendered: [String] = []
		for fragment in intermediateRepresentation.fragmentDefinitions {
			let collectionResults = try intermediateRepresentation.collectFields(for: fragment)
			let fields = collectionResults.fields.scopedTo(parentFragment: fragment.name)
			let referencedImportsForFragment = referencedImports(selections: fragment.selections, intermediateRepresentation: intermediateRepresentation)
			
			let definition: String
			switch fragment.typeCondition {
			case .interface(let interfaceType):
				let fragmentDefinition = selectionSets.fragmentDefinition(named: fragment.name)
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(
					fragmentSpreads: collectionResults.fragmentSpreads,
					inheritedType: interfaceType
				)
				
				definition = try renderUnionFragment(
					fragment: fragmentDefinition,
					typeName: interfaceType,
					commonFields: fields,
					collectedFields: collectionResults.fields,
					groupedFragmentSpreads: groupedFragmentSpreads,
					referencedImports: (referencedImportsForFragment.fragments, enums: referencedImportsForFragment.enums)
				)
			case .union(let unionType):
				let fragmentDefinition = selectionSets.fragmentDefinition(named: fragment.name)
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(
					fragmentSpreads: collectionResults.fragmentSpreads,
					inheritedType: unionType
				)
				
				definition = try renderUnionFragment(
					fragment: fragmentDefinition,
					typeName: unionType,
					commonFields: [],
					collectedFields: fields,
					groupedFragmentSpreads: groupedFragmentSpreads,
					referencedImports: (referencedImportsForFragment.fragments, enums: referencedImportsForFragment.enums)
				)
			case .object:
				let fragmentDefinition = selectionSets.fragmentDefinition(named: fragment.name)
				let fragmentSpreads = IntermediateRepresentation.fragments(
					from: collectionResults.fragmentSpreads,
					onConcreteType: fragment.typeCondition.name
				)
				
				definition = try renderObjectFragment(
					fragment: fragmentDefinition,
					typeName: fragment.typeCondition.name,
					fields: fields,
					fragmentSpreads: fragmentSpreads,
					referencedImports: (referencedImportsForFragment.fragments, enums: referencedImportsForFragment.enums)
				)
			}
			rendered.append(definition)
		}
		return rendered
	}
	
	func renderGraphApi() throws -> String {
		try render(template: "GraphApi", context: [:])
	}
	
	func renderEnumEntryPoint(intermediateRepresentation: IntermediateRepresentation) throws -> String {
		let context: [String: Any] = ["enumNames": intermediateRepresentation.referencedEnums.map { $0.name }.sorted()]
		return try render(template: "EnumTypeBarrel", asFile: true, context: context)
	}
	
	func renderInputTypeEntryPoint(intermediateRepresentation: IntermediateRepresentation) throws -> String {
		let context: [String: Any] = ["inputNames": intermediateRepresentation.referencedInputTypes.map { $0.name }.sorted()]
		return try render(template: "InputTypeBarrel", asFile: true, context: context)
	}
	
	func renderFragmentEntryPoint(intermediateRepresentation: IntermediateRepresentation) throws -> String {
		let context: [String: Any] = ["fragmentNames": intermediateRepresentation.fragmentDefinitions.map { $0.name }.sorted()]
		return try render(template: "FragmentBarrel", asFile: true, context: context)
	}
	
	private func buildObjectContext(
		name: String,
		typeName: String,
		fields: [CollectedField],
		fragmentSpreads: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment],
		extras: [String: Any]
	) -> [String: Any] {
		var context: [String: Any] = [
			"name": name,
			"typeName": typeName,
			"fields": fields,
			"fragmentSpreads": fragmentSpreads
		]
		
		context.merge(extras) { (current, _) in current }
		
		return context
	}
	
	private func buildUnionContext(
		name: String,
		typeName: String,
		parentFragment: String?,
		commonFields: [CollectedField],
		collectedFields: [CollectedField],
		groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]],
		extras: [String: Any]
	) throws -> [String: Any] {
		let fragmentSpreads = groupedFragmentSpreads[typeName] ?? []
		let filteredCollectedFields = collectedFields.filter {
			return $0.parentFragment?.name == parentFragment
		}
		let groupedFields = filteredCollectedFields.groupedFields(fromUnionType: typeName)
		let concreteTypeNames = (groupedFields.map {
			$0.key
		}).unique.sorted()
		
		let fragmentUnionGroupedFields = collectedFields.filter { field in
			return fragmentSpreads.contains { element in
				return field.parentFragment?.name == element.name
			}
		}.groupedFields(fromUnionType: typeName)
		
		let fragmentUnionTypes = fragmentUnionGroupedFields.map { key, value in
			return (fragmentName: value[0].parentFragment!.name, fieldName: key)
		}.sorted(by: { first, second in
			return first.fragmentName + first.fieldName < second.fragmentName + second.fieldName
		}).map { (fragmentName, fieldName) in
			return [
				// All values will have the same parent fragment so we can grab the name from the first value
				"fragmentName": fragmentName,
				"fieldName": fieldName
			]
		}
		
		var context: [String: Any] = [
			"name": name,
			"typeName": typeName,
			"commonFields": commonFields.isEmpty ? [] : commonFields.baseFields(fromInterfaceType: typeName),
			"fragmentSpreads": fragmentSpreads,
			"collectedFields": collectedFields,
			"concreteTypeNames": concreteTypeNames,
			"groupedFragmentSpreads": groupedFragmentSpreads,
			"fragmentUnionTypes": fragmentUnionTypes
		]
		
		if let fragment = parentFragment {
			context["parentFragment"] = fragment
		}
		
		context.merge(extras) { (current, _) in current }
		
		return context
	}
	
	private func referencedImports(
		selections: [IntermediateRepresentation.Selection],
		intermediateRepresentation: IntermediateRepresentation,
		variables: [IntermediateRepresentation.Variable] = []
	) -> (
		fragments: [String],
		enums: [String],
		inputs: [String]
	) {
		func readFieldType(fieldType: IntermediateRepresentation.FieldType, _ fragmentImports: inout [String], _ enumImports: inout [String]) {
			switch fieldType {
			case .nonNull(let fieldType):
				readFieldType(fieldType: fieldType, &fragmentImports, &enumImports)
			case .list(let fieldType):
				readFieldType(fieldType: fieldType, &fragmentImports, &enumImports)
			case .enum(let enumName):
				enumImports.append(enumName)
			case .interface(let interface):
				let imports = referencedImports(selections: interface.selectionSet, intermediateRepresentation: intermediateRepresentation)
				fragmentImports.append(contentsOf: imports.fragments)
				enumImports.append(contentsOf: imports.enums)
			case .union(let union):
				let imports = referencedImports(selections: union.selectionSet, intermediateRepresentation: intermediateRepresentation)
				fragmentImports.append(contentsOf: imports.fragments)
				enumImports.append(contentsOf: imports.enums)
			case .object(let object):
				let imports = referencedImports(selections: object.selectionSet, intermediateRepresentation: intermediateRepresentation)
				fragmentImports.append(contentsOf: imports.fragments)
				enumImports.append(contentsOf: imports.enums)
			default:
				break
			}
		}
		
		var fragments: [String] = []
		var enums: [String] = []
		var inputs: [String] = []
		
		for variable in variables {
			addEnumAndInputImportIfFound(variableType: variable.type, &inputs, &enums)
		}
		
		for selection in selections {
			switch selection {
			case .field(let field):
				readFieldType(fieldType: field.type, &fragments, &enums)
			case .fragmentSpread(let fragment):
				fragments.append(fragment.name)
			case .inlineFragment(let inlineFragment):
				let imports = referencedImports(selections: inlineFragment.selectionSet, intermediateRepresentation: intermediateRepresentation)
				fragments.append(contentsOf: imports.fragments)
				enums.append(contentsOf: imports.enums)
			}
		}
		
		return (
			fragments: fragments.unique,
			enums: enums.unique,
			inputs: inputs.unique
		)
	}
	
	private func addEnumAndInputImportIfFound(variableType: IntermediateRepresentation.Variable.VariableType, _ inputImports: inout [String], _ enumImports: inout [String]) {
		switch variableType {
		case .enum(let enumName):
			enumImports.append(enumName)
		case .input(let inputName):
			inputImports.append(inputName)
		case .nonNull(let wrappedType):
			addEnumAndInputImportIfFound(variableType: wrappedType, &inputImports, &enumImports)
		case .list(let wrappedType):
			addEnumAndInputImportIfFound(variableType: wrappedType, &inputImports, &enumImports)
		default:
			break
		}
	}
	
	private static func customExtension() -> Extension {
		let customExtension = Extension()
		
		customExtension.registerFilter("renderPropertyDeclaration") { (value, args) -> Any? in
			func produceFieldName(field: CollectedField) -> String {
				if field.type.isNonNull {
					return field.name
				} else {
					return "\(field.name)?"
				}
			}
			
			let prefix = args.first as? String ?? ""
			let seperator = args.dropFirst().first as? String ?? ""
			let combined = "\(prefix)\(seperator)"
			
			if let field = value as? IntermediateRepresentation.CollectedObjectField {
				return "\(produceFieldName(field: field)): \(TypeScriptTypeAnnotationRenderer.render(objectField: field, prefix: combined))"
			} else if let field = value as? IntermediateRepresentation.CollectedScalarField {
				return "\(produceFieldName(field: field)): \(TypeScriptTypeAnnotationRenderer.render(scalarField: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				return "\(produceFieldName(field: field)): \(TypeScriptTypeAnnotationRenderer.render(unionWrapper: field, prefix: combined))"
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				return "\(produceFieldName(field: field)): \(TypeScriptTypeAnnotationRenderer.render(interfaceWrapper: field, prefix: combined))"
			}
			return nil
		}
		
		return customExtension
	}
}
