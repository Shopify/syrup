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

import Stencil

final class SwiftNestedRendererExtension: Extension {
	let config: Config
	init(config: Config) {
		self.config = config
		super.init()
		
		registerFilter("nestedTypeDefinition") { (value, args) -> Any? in
			guard let field = value as? IntermediateRepresentation.CollectedObjectField else { return nil }
			let fields = field.collectedFields.scopedTo(parentFragment: field.parentFragment?.name)
			let name = field.name.capitalizedFirstLetter
			let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
			let fragmentSpreads = IntermediateRepresentation.fragments(from: field.fragmentSpreads, onConcreteType: field.type.graphQLName)
			
			let computedFragmentFields = field.collectedFields.computedFragmentFields(fragmentSpreads: fragmentSpreads, parentType: field.type.graphQLName)
			let graphQLName = field.type.graphQLName
			let renderer = SwiftRenderer(config: config)
			return try! renderer.renderResponseType(name: name, graphQLName: graphQLName, fields: fields, fragmentSpreads: fragmentSpreads, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars).indented()
		}
		
		registerFilter("nestedInterfaceWrapper") { (value, args) -> Any? in
			guard let field = value as? IntermediateRepresentation.CollectedInterfaceField else { return nil }
			let renderer = SwiftRenderer(config: config)
			return try! renderer.renderInterfaceWrapper(field: field)
		}
		
		registerFilter("nestedInterfaceTypeDefinitions") { (value, args) -> Any? in
			var rendered = ""
			guard let collectedFields = value as? [CollectedField], let interfaceTypeName = args.first as? String, let groupedProtocolConformances = args.dropFirst().first as? [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], let groupedComputedFragmentFields = args.dropFirst(2).first as? [String: [CollectedField]], let concreteTypeNames = args.dropFirst(3).first as? [String] else { return nil }
			let groupedFields = try collectedFields.groupedFields(fromInterfaceType: interfaceTypeName)
			concreteTypeNames.forEach { concreteType in
				let graphQLName = concreteType
				let computedFragmentFields = groupedComputedFragmentFields[concreteType] ?? []
				let fields = groupedFields[concreteType] ?? []
				let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
				var protocolConformances = groupedProtocolConformances[concreteType] ?? []
				protocolConformances.append(contentsOf: groupedProtocolConformances[interfaceTypeName] ?? [])
				
				let renderer = SwiftRenderer(config: config)
				rendered += try! renderer.renderResponseType(name: "\(graphQLName)", graphQLName: graphQLName, fields: fields, fragmentSpreads: protocolConformances.unique, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars)
			}
			
			let fallbackName = "Base\(interfaceTypeName)"
			let protocolConformances = groupedProtocolConformances[interfaceTypeName] ?? []
			let computedFragmentFields = groupedComputedFragmentFields[interfaceTypeName] ?? []
			let fields = collectedFields.baseFields(fromInterfaceType: interfaceTypeName)
			let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
			let renderer = SwiftRenderer(config: config)
			rendered += try! renderer.renderResponseType(name: fallbackName, graphQLName: interfaceTypeName, fields: fields, fragmentSpreads: protocolConformances, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars)
			return rendered
		}
		
		registerFilter("nestedUnionWrapper") { (value, args) -> Any? in
			guard let field = value as? IntermediateRepresentation.CollectedUnionField else { return nil }
			let renderer = SwiftRenderer(config: config)
			return try! renderer.renderUnionWrapper(field: field)
		}
		
		registerFilter("nestedUnionTypeDefinitions") { (value, args) -> Any? in
			var rendered = ""
			guard let collectedFields = value as? [CollectedField], let unionTypeName = args.first as? String, let groupedProtocolConformances = args.dropFirst().first as? [String: [IntermediateRepresentation.SelectionPath.PathComponent.Fragment]], let concreteTypeNames = args.dropFirst(2).first as? [String] else { return nil }
			let groupedFields = collectedFields.groupedFields(fromUnionType: unionTypeName)
						
			concreteTypeNames.forEach { concreteType in
				let graphQLName = concreteType
				let fields = groupedFields[concreteType] ?? []
				let hasCustomCodedScalars = fields.filter { $0.type.nestedScalar is IntermediateRepresentation.CustomCodedScalar }.count > 0
				let protocolConformances = groupedProtocolConformances[concreteType] ?? []
				let computedFragmentFields = collectedFields.computedFragmentFields(fragmentSpreads: protocolConformances, parentType: concreteType)
				let renderer = SwiftRenderer(config: config)
				rendered += try! renderer.renderResponseType(name: "\(graphQLName)", graphQLName: graphQLName, fields: fields, fragmentSpreads: protocolConformances, computedFragmentFields: computedFragmentFields, requiresCustomCoder: hasCustomCodedScalars)
			}
			return rendered
		}
		
		registerFilter("renderComputedPropertyDeclaration") { (value, args) -> Any? in
			guard let field = value as? CollectedField, let fragmentName = field.parentFragment?.name else {
				return nil
			}
			let prefix = "\(config.project.moduleName).\(fragmentName)."
			if let field = value as? IntermediateRepresentation.CollectedObjectField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(objectField: field, prefix: prefix))"
			} else if let field = value as? IntermediateRepresentation.CollectedScalarField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(scalarField: field))"
			} else if let field = value as? IntermediateRepresentation.CollectedInterfaceField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(interfaceWrapper: field, prefix: prefix))"
			} else if let field = value as? IntermediateRepresentation.CollectedUnionField {
				return "\(field.name): \(SwiftTypeAnnotationRenderer.render(unionWrapper: field, prefix: prefix))"
			}
			return nil
		}
	}
}
