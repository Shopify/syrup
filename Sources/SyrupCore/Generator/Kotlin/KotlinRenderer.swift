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

final class KotlinRenderer: Renderer {
	override class func customExtensions(config: Config) -> [Extension] {
		[
			KotlinRenderer.customExtension(),
			ReservedWordsExtension(reservedWords: config.template.specification.reservedWords),
			ArgumentRendererExtension<KotlinVariableTypeRenderer>(
					reservedWords: config.template.specification.reservedWords,
					null: config.template.specification.nullString),
			KotlinNestedRendererExtension(config: config),
			SelectionSetExtension()
		]
	}

	func renderGraphApi() throws -> String {
		try render(template: "GraphApi", context: [:])
	}

	func renderInputWrapper() throws -> String {
		try render(template: "InputWrapper", context: [:])
	}

	func renderResponseTypes(intermediateRepresentation: IntermediateRepresentation) throws -> [String] {
		var rendered: [String] = []
		let importEnums = intermediateRepresentation.referencedEnums.isEmpty == false
		for operation in intermediateRepresentation.operations {
			let name = "\(operation.name)Response"
			let graphQLName: String = operation.typeName
			let collectionResults = try intermediateRepresentation.collectFields(for: operation)
			let fields = collectionResults.fields.scopedTo(parentFragment: nil)
			let fragmentSpreads = IntermediateRepresentation.fragments(from: collectionResults.fragmentSpreads, onConcreteType: graphQLName)

			rendered.append(try renderResponseType(name: name, graphQLName: graphQLName, fields: fields, fragmentNames: fragmentSpreads.map {
				$0.name
			}, asFile: true, importEnums: importEnums))
		}
		return rendered
	}

	func renderResponseType(name: String, graphQLName: String, fields: [CollectedField], fragmentNames: [String], fragmentSelections: SelectionSetVisitor.FragmentDefinition? = nil, superclassOverride: String = "", asFile: Bool = false, importEnums: Bool = false, package: String = "responses") throws -> String {
		var context: [String: Any] = [
			"name": name,
			"graphQLName": graphQLName,
			"fields": fields,
			"superclassOverride": superclassOverride,
			"fragmentNames": fragmentNames,
			"importEnums": importEnums,
			"package": package,
			"fragmentDefinition": package == "fragments",
			"fragmentSelections": fragmentSelections?.selectionSet ?? []
		]
		if asFile {
			let containsFragment = !fragmentNames.isEmpty || checkContainsFragment(fields: fields)
			context["containsFragment"] = containsFragment
		}
		return try render(template: "ResponseType", asFile: asFile, context: context)
	}

	func renderFragmentDefinitions(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [String] {
		var rendered: [String] = []
		let importEnums = intermediateRepresentation.referencedEnums.isEmpty == false
		for fragment in intermediateRepresentation.fragmentDefinitions {
			let collectionResults = try intermediateRepresentation.collectFields(for: fragment)
			let fields = collectionResults.fields.scopedTo(parentFragment: fragment.name)
			let definition: String
			switch fragment.typeCondition {
			case .interface(let interfaceType):
				let fragmentSelections = selectionSets.fragmentDefinition(named: fragment.name)
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: collectionResults.fragmentSpreads, inheritedType: interfaceType)
				definition = try renderInterfaceWrapper(name: fragment.name, scopedFields: fields, collectedFields: collectionResults.fields, interfaceTypeName: interfaceType, groupedFragmentSpreads: groupedFragmentSpreads, fragmentSelections: fragmentSelections, asFile: true, importEnums: importEnums)
			case .union(let unionType):
				let fragmentSelections = selectionSets.fragmentDefinition(named: fragment.name)
				let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(fragmentSpreads: collectionResults.fragmentSpreads, inheritedType: unionType)
				definition = try renderUnionWrapper(name: fragment.name, unionTypeName: unionType, collectedFields: fields, groupedFragmentSpreads: groupedFragmentSpreads, fragmentSelections: fragmentSelections, asFile: true, importEnums: importEnums)
			case .object:
				let fragmentSelections = selectionSets.fragmentDefinition(named: fragment.name)
				let fragmentSpreads = IntermediateRepresentation.fragments(from: collectionResults.fragmentSpreads, onConcreteType: fragment.typeCondition.name)
				definition = try renderResponseType(name: fragment.name, graphQLName: fragment.typeCondition.name, fields: fields, fragmentNames: fragmentSpreads.map {
					$0.name
				}, fragmentSelections: fragmentSelections, asFile: true, importEnums: importEnums, package: "fragments")
			}
			rendered.append(definition)
		}
		return rendered
	}

	//check if any of the fields or nested fields contains a fragment path
	func checkContainsFragment(fields: [CollectedField]) -> Bool {
		for field in fields {
			if field.parentFragment != nil {
				return true
			}
			if let nestedField = field as? IntermediateRepresentation.CollectedObjectField {
				if checkContainsFragment(fields: nestedField.collectedFields) {
					return true
				}
			} else if let nestedField = field as? IntermediateRepresentation.CollectedUnionField {
				if checkContainsFragment(fields: nestedField.collectedFields) {
					return true
				}
			} else if let nestedField = field as? IntermediateRepresentation.CollectedInterfaceField {
				if checkContainsFragment(fields: nestedField.collectedFields) {
					return true
				}
			}
		}
		return false
	}

	func renderUnionWrapper(name: String, unionTypeName: String, collectedFields: [CollectedField], groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], fragmentSelections: SelectionSetVisitor.FragmentDefinition? = nil, asFile: Bool = false, importEnums: Bool = false) throws -> String {
		let groupedFields = collectedFields.groupedFields(fromUnionType: unionTypeName)
		var concreteTypeNames = groupedFields.map {
			$0.key
		}
		concreteTypeNames.append(contentsOf: groupedFragmentSpreads.keys.filter {
			$0 != unionTypeName
		})
		concreteTypeNames = concreteTypeNames.unique.sorted()
		let fragmentSpreads = groupedFragmentSpreads[unionTypeName] ?? []

		let context: [String: Any] = [
			"name": name,
			"unionTypeName": unionTypeName,
			"concreteTypeNames": concreteTypeNames,
			"fragmentSpreads": fragmentSpreads,
			"groupedFragmentSpreads": groupedFragmentSpreads,
			"collectedFields": collectedFields,
			"package": "fragments",
			"importEnums": importEnums,
			"fragmentSelections": fragmentSelections?.selectionSet ?? []
		]
		return try render(template: "UnionWrapper", asFile: asFile, context: context)
	}

	func renderInterfaceWrapper(name: String, scopedFields: [CollectedField], collectedFields: [CollectedField], interfaceTypeName: String, groupedFragmentSpreads: [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], fragmentSelections: SelectionSetVisitor.FragmentDefinition? = nil, asFile: Bool = false, importEnums: Bool = false) throws -> String {
		let groupedFields = try scopedFields.groupedFields(fromInterfaceType: interfaceTypeName)
		let baseFields = scopedFields.baseFields(fromInterfaceType: interfaceTypeName)
		var concreteTypeNames = groupedFields.map {
			$0.key
		}
		concreteTypeNames.append(contentsOf: groupedFragmentSpreads.keys.filter {
			$0 != interfaceTypeName
		})
		concreteTypeNames = concreteTypeNames.unique.sorted()
		let fragmentSpreads = groupedFragmentSpreads[interfaceTypeName] ?? []
		let context: [String: Any] = [
			"name": name,
			"baseFields": baseFields,
			"collectedFields": scopedFields,
			"interfaceTypeName": interfaceTypeName,
			"concreteTypeNames": concreteTypeNames,
			"fragmentSpreads": fragmentSpreads,
			"groupedFragmentSpreads": groupedFragmentSpreads,
			"package": "fragments",
			"importEnums": importEnums,
			"fragmentSelections": fragmentSelections?.selectionSet ?? []
		]
		return try render(template: "InterfaceWrapper", asFile: asFile, context: context)
	}

	private static func customExtension() -> Extension {
		let customExtension = Extension()

		customExtension.registerFilter("renderPropertyDeclaration") { (value, args) -> Any? in

			enum Context: String {
				case interfaceWrapper
				case unknown
			}

			let contextString = args.dropFirst().first as? String
			let context = Context(rawValue: contextString ?? "") ?? .unknown
			var prefix: String? = nil
			if let field = value as? IntermediateRepresentation.CollectedObjectField {
				if case .interfaceWrapper = context {
					prefix = "Base\(field.parentType.capitalizedFirstLetter)"
				}
				return "\(field.name): \(KotlinTypeAnnotationRenderer.render(objectField: field, prefix: prefix))"
			} else if let field = value as? IntermediateRepresentation.CollectedScalarField {
				return "\(field.name): \(KotlinTypeAnnotationRenderer.render(scalarField: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				return "\(field.name): \(KotlinTypeAnnotationRenderer.render(unionWrapper: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				if case .interfaceWrapper = context {
					prefix = "Base\(field.parentType.capitalizedFirstLetter)"
				}
				return "\(field.name): \(KotlinTypeAnnotationRenderer.render(interfaceWrapper: field, prefix: prefix))"
			}
			return nil
		}

		customExtension.registerFilter("decodeField") { (value) -> Any? in
			guard let field = value as? CollectedField else {
				return nil
			}
			let fieldName: String
			let typeAnnotation: String
			if let scalarField = field as? IntermediateRepresentation.CollectedScalarField {
				typeAnnotation = KotlinRenderer.decodeJsonScalarField(collectedScalarField: scalarField, nonNull: false, fieldName: field.name)
				fieldName = field.name
			} else if let objectField = field as? IntermediateRepresentation.CollectedObjectField {
				typeAnnotation = KotlinRenderer.decodeJsonObjectField(collectedObjectFieldType: objectField, nonNull: false, fieldName: field.name)
				fieldName = field.name
			} else if let interfaceField = field as? IntermediateRepresentation.CollectedInterfaceField {
				typeAnnotation = KotlinRenderer.decodeInterfaceTypeField(collectedInterfaceField: interfaceField, fieldName: interfaceField.name, nonNull: false)
				fieldName = field.name
			} else if let unionField = field as? IntermediateRepresentation.CollectedUnionField {
				typeAnnotation = KotlinRenderer.decodeUnionTypeField(collectedUnionField: unionField, fieldName: unionField.name, nonNull: false)
				fieldName = field.name
			} else {
				fatalError("Unable to determine type annotation \(field)")
			}
			return "\(fieldName) = \(typeAnnotation)"
		}
		return customExtension
	}

	static func decodeJsonScalarField(collectedScalarField: IntermediateRepresentation.CollectedScalarField, nonNull: Bool, fieldName: String) -> String {
		decodeJsonScalarField(field: collectedScalarField, fieldType: collectedScalarField.type, fieldName: fieldName, nonNull: nonNull)
	}

	static func decodeJsonScalarField(field: IntermediateRepresentation.CollectedScalarField, fieldType: FieldTypeProtocol, fieldName: String, nonNull: Bool) -> String {
		switch fieldType {
		case let fieldType as IntermediateRepresentation.ScalarFieldType:
			let scalar = fieldType.scalar
			if nonNull {
				return "OperationGsonBuilder.gson.fromJson(jsonObject.get(\"\(fieldName)\"), \(scalar.nativeType)::class.java)"
			}
			return "if (!jsonObject.has(\"\(fieldName)\") || jsonObject.get(\"\(fieldName)\").isJsonNull) null else OperationGsonBuilder.gson.fromJson(jsonObject.get(\"\(fieldName)\"), \(scalar.nativeType)::class.java)"
		case _ as IntermediateRepresentation.ListFieldType:
			return decodeScalarFieldArray(field: field, fieldname: fieldName, nonNull: nonNull)
		case let fieldType as IntermediateRepresentation.NonNullFieldType:
			let nested = fieldType.nestedType
			return decodeJsonScalarField(field: field, fieldType: nested, fieldName: fieldName, nonNull: true)
		case let fieldType as IntermediateRepresentation.EnumFieldType:
			let rendered: String = "\(fieldType.graphQLName).safeValueOf(jsonObject.decodeEnumValue<\(fieldType.graphQLName)>(\"\(fieldName)\"))"
			if nonNull {
				return rendered
			} else {
				return "if (jsonObject.has(\"\(fieldName)\") && !jsonObject.get(\"\(fieldName)\").isJsonNull) \(rendered) else null"
			}
		default: return ""
		}
	}

	//Decode Object Type fields
	static func decodeJsonObjectField(collectedObjectFieldType: IntermediateRepresentation.CollectedObjectField, nonNull: Bool, fieldName: String) -> String {
		decodeJsonObjectField(collectedObjectField: collectedObjectFieldType, objectFieldType: collectedObjectFieldType.type, nonNull: nonNull, fieldName: fieldName)
	}

	static func decodeJsonObjectField(collectedObjectField: IntermediateRepresentation.CollectedObjectField?, objectFieldType: FieldTypeProtocol, nonNull: Bool, fieldName: String) -> String {
		switch objectFieldType {
		case let fieldType as IntermediateRepresentation.NonNullFieldType:
			let nested = fieldType.nestedType
			if nested.isList {
				var rendered: String = ""
				if nested.nestedScalar != nil {
					rendered = decodeJsonObjectField(collectedObjectFieldType: collectedObjectField!, nonNull: true, fieldName: fieldName)
				} else if nested.isObject {
					let typeAnnotation: String = "\(KotlinTypeAnnotationRenderer.render(objectField: collectedObjectField!))"
					rendered = decodeObjectArray(typeAnnotation: typeAnnotation, objectField: collectedObjectField!.type, fieldName: fieldName, isNonNullList: collectedObjectField!.type.isNonNull)
				}
				return rendered
			} else {
				return "\(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\"))"
			}
		case is IntermediateRepresentation.ListFieldType:
			let typeAnnotation: String = "\(KotlinTypeAnnotationRenderer.render(objectField: collectedObjectField!))"
			return decodeObjectArray(typeAnnotation: typeAnnotation, objectField: collectedObjectField!.type, fieldName: fieldName, isNonNullList: objectFieldType.isNonNull)
		case let fieldType as IntermediateRepresentation.ScalarFieldType:
			let scalar = fieldType.scalar
			return "OperationGsonBuilder.gson.fromJson(jsonObject.get(\"\(fieldName)\"), \(scalar.nativeType)::class.java)"
		case is IntermediateRepresentation.EnumFieldType:
			let rendered: String = "\(objectFieldType.graphQLName).safeValueOf(jsonObject.decodeEnumValue<\(objectFieldType.graphQLName)>(\"\(fieldName)\"))"
			return rendered
		case is IntermediateRepresentation.ObjectFieldType:
			var rendered: String
			if !nonNull {
				rendered = "if (jsonObject.has(\"\(fieldName)\") && !jsonObject.get(\"\(fieldName)\").isJsonNull) \(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\")) else null"
			} else {
				rendered = decodeJsonObjectField(collectedObjectField: collectedObjectField, objectFieldType: objectFieldType, nonNull: true, fieldName: fieldName)
			}
			return rendered
		default:
			return "\(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\"))"
		}
	}

	static func decodeInterfaceTypeField(collectedInterfaceField: IntermediateRepresentation.CollectedInterfaceField, fieldName: String, nonNull: Bool) -> String {
		switch collectedInterfaceField.type {
		case is IntermediateRepresentation.ScalarFieldType:
			return "Scalar"
		case let fieldType as IntermediateRepresentation.NonNullFieldType:
			let nested = fieldType.nestedType
			var rendered = ""
			if nested.isList {
				if nested.nestedScalar != nil {
					rendered = "jsonObject.decodePrimitivesArray(\"\(fieldName)\")"
				} else {
					let arrayTypeAnnotation = KotlinTypeAnnotationRenderer.render(interfaceWrapper: collectedInterfaceField)
					rendered = decodeObjectArray(typeAnnotation: arrayTypeAnnotation, objectField: collectedInterfaceField.type, fieldName: fieldName, isNonNullList: collectedInterfaceField.type.isNonNull)
				}
			} else {
				rendered = "\(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\"))"
			}
			return rendered
		case is IntermediateRepresentation.ListFieldType:
			let arrayTypeAnnotation = KotlinTypeAnnotationRenderer.render(interfaceWrapper: collectedInterfaceField)
			return decodeObjectArray(typeAnnotation: arrayTypeAnnotation, objectField: collectedInterfaceField.type, fieldName: fieldName, isNonNullList: collectedInterfaceField.type.isNonNull)
		case is IntermediateRepresentation.ObjectFieldType:
			return "Object that can be null"
		case is IntermediateRepresentation.NonNullFieldType:
			return decodeInterfaceTypeField(collectedInterfaceField: collectedInterfaceField, fieldName: fieldName, nonNull: true)
		default:
			return "if (jsonObject.has(\"\(fieldName)\") && !jsonObject.get(\"\(fieldName)\").isJsonNull) \(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\")) else null"
		}
	}

	static func decodeUnionTypeField(collectedUnionField: IntermediateRepresentation.CollectedUnionField, fieldName: String, nonNull: Bool) -> String {
		switch collectedUnionField.type {
		case is IntermediateRepresentation.ScalarFieldType:
			return "Scalar"
		case let fieldType as IntermediateRepresentation.NonNullFieldType:
			let nested = fieldType.nestedType
			var rendered = ""
			if nested.isList {
				if nested.nestedScalar != nil {
					rendered = "jsonObject.decodePrimitivesArray(\"\(fieldName)\")"
				} else {
					let arrayTypeAnnotation = KotlinTypeAnnotationRenderer.render(unionWrapper: collectedUnionField)
					rendered = decodeObjectArray(typeAnnotation: arrayTypeAnnotation, objectField: collectedUnionField.type, fieldName: fieldName, isNonNullList: collectedUnionField.type.isNonNull)
				}
			} else {
				rendered = "\(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\"))"
			}
			return rendered
		case is IntermediateRepresentation.ListFieldType:
			let arrayTypeAnnotation = KotlinTypeAnnotationRenderer.render(unionWrapper: collectedUnionField)
			return decodeObjectArray(typeAnnotation: arrayTypeAnnotation, objectField: collectedUnionField.type, fieldName: fieldName, isNonNullList: collectedUnionField.type.isNonNull)
		case is IntermediateRepresentation.ObjectFieldType:
			return "Object that can be null"
		case is IntermediateRepresentation.NonNullFieldType:
			return decodeUnionTypeField(collectedUnionField: collectedUnionField, fieldName: fieldName, nonNull: true)
		default:
			return "if (jsonObject.has(\"\(fieldName)\") && !jsonObject.get(\"\(fieldName)\").isJsonNull) \(fieldName.capitalizedFirstLetter)(jsonObject.getAsJsonObject(\"\(fieldName)\")) else null"
		}
	}

	//Decode Primitive Arrays
	static func decodeScalarFieldArray(field: IntermediateRepresentation.CollectedScalarField, fieldname: String, nonNull: Bool) -> String {
		let scalar = field.type.nestedScalar
		let scalarNativeType = scalar?.nativeType
		let typeAnnotation = KotlinTypeAnnotationRenderer.render(scalarField: field)

		var fieldDecodingTemplate = ""
		if scalarNativeType != nil {
			fieldDecodingTemplate = "OperationGsonBuilder.gson.fromJson(it, \(scalarNativeType!)::class.java)"
		} else {
			fieldDecodingTemplate = "\(field.type.graphQLName).safeValueOf(it.asString)"
		}

		if nonNull {
			return """
				   with(jsonObject.getAsJsonArray("\(fieldname)")) {
				   val list: \(typeAnnotation) = ArrayList()
				   this.forEach { list.add(\(fieldDecodingTemplate)) }
				   list
				   }
				   """
		} else {
			let annotationNullabilityQuestionMark = typeAnnotation.firstIndex(of: "?") ?? typeAnnotation.endIndex
			let listInitializationTypeAnnotation = typeAnnotation[..<annotationNullabilityQuestionMark]

			return """
				   if(!jsonObject.has(\"\(fieldname)\") || jsonObject.get("\(fieldname)").isJsonNull) null else jsonObject.getAsJsonArray("\(fieldname)")?.run {
				   val list: \(listInitializationTypeAnnotation) = ArrayList()
				   this.forEach { list.add(\(fieldDecodingTemplate)) }
				   list
				   }
				   """
		}
	}

	static func decodeObjectArray(typeAnnotation: String, objectField: FieldTypeProtocol, fieldName: String, isNonNullList: Bool) -> String {
		let isListObjectNonNull = isNonNullListObject(objectType: objectField, parentNonNull: isNonNullList)

		let listObjectNullabilityMarker = "\(isListObjectNonNull ? "" : "?")"

		var listInitializer = ""
		var listNullabilityMarker = ""

		if isNonNullList {
			listNullabilityMarker = ""
			listInitializer = "arrayListOf<\(fieldName.capitalizedFirstLetter)\(listObjectNullabilityMarker)>()"
		} else {
			listNullabilityMarker = "?"
			listInitializer = "null"
		}

		var objectDeserializerExpression = ""
		if isListObjectNonNull {
			objectDeserializerExpression = "\(fieldName.capitalizedFirstLetter)(it.asJsonObject)"
		} else {
			objectDeserializerExpression = """
										   if(it.isJsonNull) null else \(fieldName.capitalizedFirstLetter)(it.asJsonObject)
										   """
		}

		return """
			   if(!jsonObject.has(\"\(fieldName)\") || jsonObject.get("\(fieldName)").isJsonNull) \(listInitializer) else jsonObject.getAsJsonArray("\(fieldName)").run {
			   val list: \(typeAnnotation) = ArrayList()
			   this.forEach { 
			   		val \(fieldName) = \(objectDeserializerExpression)
			   		list\(listNullabilityMarker).add(\(fieldName))
			   }
			   list
			   }
			   """
	}

	private static func isNonNullListObject(objectType: FieldTypeProtocol, parentNonNull: Bool) -> Bool {
		let nonNull: Bool
		switch objectType {
		case is IntermediateRepresentation.ObjectFieldType, is IntermediateRepresentation.InterfaceFieldType, is IntermediateRepresentation.UnionFieldType:
			nonNull = objectType.isNonNull
		case let listType as IntermediateRepresentation.ListFieldType:
			nonNull = listType.elementType.isNonNull
		case let nonNullType as IntermediateRepresentation.NonNullFieldType:
			nonNull = isNonNullListObject(objectType: nonNullType.nestedType, parentNonNull: true)
		default:
			fatalError("Encountered unexpected type \(objectType)")
		}

		return nonNull
	}
}
