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

final class TypeScriptInternalRendererExtension: Extension {
	private let config: Config
	init(config: Config) {
		self.config = config
		super.init()
		
		func renderUnionableField(
			renderer: TypeScriptRenderer,
			fieldName: String,
			typeName: String,
			commonFields: [CollectedField],
			collectedFields: [CollectedField],
			fragmentSpreads: [IntermediateRepresentation.SelectionPath],
			parentFragment: IntermediateRepresentation.SelectionPath.PathComponent.Fragment?
		) -> String {
			let groupedFragmentSpreads = IntermediateRepresentation.groupedFragmentSpreads(
				fragmentSpreads: fragmentSpreads,
				inheritedType: typeName
			)
			
			return try! renderer.renderUnionableField(
				fieldName: fieldName,
				typeName: typeName,
				parentFragment: parentFragment?.name,
				commonFields: commonFields,
				collectedFields: collectedFields,
				groupedFragmentSpreads: groupedFragmentSpreads
			)
		}
		
		registerFilter("internalFieldType") { (value, args) -> Any? in
			guard let field = value as? CollectedField else { return nil }
			
			let parentName = args.first as? String ?? ""
			let internalFieldName = "\(parentName)\(field.name.capitalizedFirstLetter)"
			let parentFragment = field.parentFragment
			
			let renderer = TypeScriptRenderer(config: config)
			
			switch field {
			case let interfaceField as IntermediateRepresentation.CollectedInterfaceField:
				return renderUnionableField(
					renderer: renderer,
					fieldName: internalFieldName,
					typeName: interfaceField.type.graphQLName,
					commonFields: interfaceField.collectedFields.scopedTo(parentFragment: parentFragment?.name),
					collectedFields: interfaceField.collectedFields,
					fragmentSpreads: interfaceField.fragmentSpreads,
					parentFragment: parentFragment
				)
			case let unionField as IntermediateRepresentation.CollectedUnionField:
				return renderUnionableField(
					renderer: renderer,
					fieldName: internalFieldName,
					typeName: unionField.type.graphQLName,
					commonFields: [],
					collectedFields: unionField.collectedFields.scopedTo(parentFragment: parentFragment?.name),
					fragmentSpreads: unionField.fragmentSpreads,
					parentFragment: parentFragment
				)
			case let objectField as IntermediateRepresentation.CollectedObjectField:
				let fields = objectField.collectedFields.scopedTo(parentFragment: parentFragment?.name)
				let fragmentSpreads = IntermediateRepresentation.fragments(from: objectField.fragmentSpreads, onConcreteType: objectField.type.graphQLName)
				if fields.isEmpty && fragmentSpreads.isEmpty { return nil }
				
				return try! renderer.renderObjectField(
					name: internalFieldName,
					typeName: field.type.graphQLName,
					fields: fields,
					fragmentSpreads: fragmentSpreads
				)
			default:
				return nil
			}
		}
		
		registerFilter("internalUnionDefinitions") { (value, args) -> Any? in
			var rendered = ""
			guard let collectedFields = value as? [CollectedField],
				  let parentName = args.first as? String,
				  let typeName = args.dropFirst(1).first as? String,
				  let groupedProtocolConformances = args.dropFirst(2).first as? [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]],
				  let concreteTypeNames = args.dropFirst(3).first as? [String]
			else { return nil }
			
			let parentFragment = args.dropFirst(4).first as? String
			let groupedFields = collectedFields.groupedFields(fromUnionType: typeName)
			let renderer = TypeScriptRenderer(config: config)
			
			concreteTypeNames.forEach { concreteType in
				let fields = groupedFields[concreteType]?.scopedTo(parentFragment: parentFragment) ?? []
				let protocolConformances = groupedProtocolConformances[concreteType] ?? []
				rendered += try! renderer.renderObjectField(
					name: "\(parentName)\(concreteType)",
					typeName: concreteType,
					fields: fields,
					fragmentSpreads: protocolConformances
				)
			}
			return rendered
		}
	}
}
