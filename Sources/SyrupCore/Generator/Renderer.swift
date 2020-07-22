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

open class Renderer {
	class func customExtensions(config: Config) -> [Extension] {
		return []
	}
	let config: Config
	let environment: Environment
	
	public required init(config: Config) {
		self.config = config
		var extensions: [Extension] = [SyrupStencilExtension(), IntermediateRepresentationExtension()]
		extensions.append(contentsOf: type(of: self).customExtensions(config: config))
		self.environment = Environment(
			loader: FileSystemLoader(paths: [Path(config.template.location)]),
			extensions: extensions,
			templateClass: SyrupTemplate.self
		)
	}
	
	func render(template: String, asFile: Bool = false, context: [String: Any]) throws -> String {
		let globalContext: [String: Any] = [
			"header": config.project.header ?? "",
			"supportFilesHeader": config.project.supportFilesHeader ?? "",
			"accessLevel": config.project.accessLevel,
			"asFile": asFile,
			"moduleName": config.project.moduleName
		]
		let mergedContext = context.merging(globalContext, uniquingKeysWith: { value, _ in return value })
		let templateName = "\(template).stencil"
		do {
			let rendered = try environment.renderTemplate(name: templateName, context: mergedContext)
			return rendered.removingExcessNewlines
		} catch _ as TemplateDoesNotExist {
			print("Skipping missing template \(templateName)")
			return ""
		} catch let error as TemplateSyntaxError {
			print("Syntax error in template \(template): \(error)")
			throw error
		} catch let error {
			throw error
		}
	}
	
	func renderQueries(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [String] {
		var rendered: [String] = []
		for query in intermediateRepresentation.operations.queries {
			rendered.append(try renderQuery(query: query, intermediateRepresentation: intermediateRepresentation, querySelections: selectionSets.operation(named: query.name)))
		}
		return rendered
	}
	
	func renderQuery(query: IntermediateRepresentation.OperationDefinition, intermediateRepresentation: IntermediateRepresentation, querySelections: SelectionSetVisitor.Operation) throws -> String {
		let name = "\(query.name)Query"
		let queryString = intermediateRepresentation.fullQueryString(for: query).removingLeadingSpaces.removingNewLines
		let importEnums = intermediateRepresentation.referencedEnums.isEmpty == false
		let importInputs = intermediateRepresentation.referencedInputTypes.isEmpty == false
		let importFragments = intermediateRepresentation.fragmentDefinitions.isEmpty == false
		let requiresCustomEncoder = query.variables.contains(where: { $0.type.nestedScalar() is IntermediateRepresentation.CustomCodedScalar })
		let context: [String: Any] = [
			"name": name,
			"operation": query,
			"queryString": queryString,
			"moduleName": config.project.moduleName,
			"isQuery": true,
			"importEnums": importEnums,
			"importInputs": importInputs,
			"importFragments": importFragments,
			"requiresCustomEncoder": requiresCustomEncoder,
			"selections": querySelections.selectionSet
		]
		return try render(template: "Operation", asFile: true, context: context)
	}
	
	func renderMutations(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [String] {
		var rendered: [String] = []
		for mutation in intermediateRepresentation.operations.mutations {
			rendered.append(try renderMutation(mutation: mutation, intermediateRepresentation: intermediateRepresentation, mutationSelections: selectionSets.operation(named: mutation.name)))
		}
		return rendered
	}
	
	func renderMutation(mutation: IntermediateRepresentation.OperationDefinition, intermediateRepresentation: IntermediateRepresentation, mutationSelections: SelectionSetVisitor.Operation) throws -> String {
		let name = "\(mutation.name)Mutation"
		let queryString = intermediateRepresentation.fullQueryString(for: mutation).removingLeadingSpaces.removingNewLines
		let importEnums = intermediateRepresentation.referencedEnums.isEmpty == false
		let importInputs = intermediateRepresentation.referencedInputTypes.isEmpty == false
		let importFragments = intermediateRepresentation.fragmentDefinitions.isEmpty == false
		let requiresCustomEncoder = mutation.variables.contains(where: { $0.type.nestedScalar() is IntermediateRepresentation.CustomCodedScalar })
		let context: [String: Any] = [
			"name": name,
			"operation": mutation,
			"queryString": queryString,
			"moduleName": config.project.moduleName,
			"isQuery": false,
			"importEnums": importEnums,
			"importInputs": importInputs,
			"importFragments": importFragments,
			"requiresCustomEncoder": requiresCustomEncoder,
			"selections": mutationSelections.selectionSet
		]
		return try render(template: "Operation", asFile: true, context: context)
	}

	func renderEnumTypes(intermediateRepresentation: IntermediateRepresentation) throws -> [String] {
		var rendered: [String] = []
		for enumType in intermediateRepresentation.referencedEnums {
			let context: [String: Any] = [
				"moduleName": config.project.moduleName,
				"enumType": enumType,
				"sortedEnumValues": enumType.values.sorted { lhs, rhs in lhs.value < rhs.value }
			]
			rendered.append(try render(template: "EnumType", asFile: true, context: context))
		}
		return rendered
	}
	
	func renderInputTypes(intermediateRepresentation: IntermediateRepresentation) throws -> [String] {
		var rendered: [String] = []
		let importEnums = intermediateRepresentation.referencedEnums.isEmpty == false
		for inputType in intermediateRepresentation.referencedInputTypes {
			let requiresCustomEncoder = inputType.inputFields.contains(where: { $0.type.nestedScalar() is IntermediateRepresentation.CustomCodedScalar })
			let context: [String: Any] = [
				"inputType": inputType,
				"requiresCustomEncoder": requiresCustomEncoder,
				"moduleName": config.project.moduleName,
				"importEnums": importEnums
			]
			rendered.append(try render(template: "InputType", asFile: true, context: context))
		}
		return rendered
	}
}
