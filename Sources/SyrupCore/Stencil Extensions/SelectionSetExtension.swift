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

class SelectionSetExtension: Extension {
	override init() {
		super.init()
		
		registerFilter("renderTypeCondition", filter: renderTypeCondition)
		registerFilter("isArgumentValueType", filter: isArgumentValueType)
		registerFilter("renderOperationType", filter: renderOperationType)
		registerFilter("renderKotlinSelections", filter: renderKotlinSelections)
		registerFilter("renderTypeScriptSelections", filter: renderTypeScriptSelections)
	}
	
	func renderTypeCondition(_ value: Any?) throws -> String? {
		guard let typeCondition = value as? SelectionSetVisitor.TypeCondition else {
			return nil
		}
		switch typeCondition {
		case .interface(let name):
			return ".interface(\"\(name)\")"
		case .object(let name):
			return ".object(\"\(name)\")"
		case .union(let name):
			return ".union(\"\(name)\")"
		case .scalar(let name):
			return ".scalar(\"\(name)\")"
		}
	}
	
	func isArgumentValueType(_ value: Any?, args: [Any?]) throws -> Bool? {
		guard let argumentValue = value as? ArgumentValueType, let desiredType = args.first as? String else {
			return false
		}
		let typeDescription = String(describing: type(of: argumentValue))
		return typeDescription == desiredType
	}
	
	func renderOperationType(_ value: Any?) throws -> String? {
		guard let operationType = value as? SelectionSetVisitor.OperationType else {
			return nil
		}
		switch operationType {
		case .mutation(let mutationType):
			return ".mutation(\"\(mutationType)\")"
		case .query(let queryType):
			return ".query(\"\(queryType)\")"
		case .subscription(let subscriptionType):
			return ".subscription(\"\(subscriptionType)\")"
		}
	}
	
	// functions for rendering kotlin selections
	
	func renderArguments(_ arguments: [SelectionSetVisitor.Argument]) -> String {
		var render: [String] = []
		for arg in arguments {
			let renderValue = renderArgumentValues(arguments: [arg.value])
			render.append("\(arg.name): \(renderValue)")
		}
		if render.isEmpty {
			return ""
		} else {
			return "(\(render.joined(separator: ", ")))"
		}
	}
	
	func renderArgumentValues(arguments: [ArgumentValueType]) -> String {
		var renders: [String] = []
		for arg in arguments {
			switch arg {
			case let arg as SelectionSetVisitor.ListValue:
				renders.append("[\(renderArgumentValues(arguments: arg.values))]")
			case let arg as SelectionSetVisitor.Variable:
				renders.append("${operationVariables[\"\(arg.name)\"]}")
			case let arg as SelectionSetVisitor.IntValue:
				renders.append("\(arg.value)")
			case let arg as SelectionSetVisitor.FloatValue:
				renders.append("\(arg.value)")
			case let arg as SelectionSetVisitor.BooleanValue:
				renders.append("\(arg.value)")
			case let arg as SelectionSetVisitor.EnumValue:
				renders.append("\(arg.value)")
			case let arg as SelectionSetVisitor.StringValue:
				renders.append("\(arg.value)")
			case let arg as SelectionSetVisitor.ObjectValue:
				renders.append(renderObjectField(arg))
			default:
				renders.append("\(arg)")
			}
		}
		return renders.joined(separator: ", ")
	}
	
	func renderObjectField(_ value: SelectionSetVisitor.ObjectValue) -> String {
		let fields = value.objectFields
		var renders: [String] = []
		for field in fields {
			renders.append("\(field.name): \(renderArgumentValues(arguments: [field.value]))")
		}
		let render = "(\(renders.joined(separator: ", ")))"
		return render
	}
	
	func renderKotlinTypeCondition(_ type: SelectionSetVisitor.TypeCondition?) -> String {
		switch type {
		case .object(let name)?:
			return name
		case .interface(let name)?:
			return name
		case .union(let name)?:
			return name
		case .scalar(let name)?:
			return name
		default:
			return "null"
		}
	}
	
	func renderTypeScriptArguments(_ arguments: [SelectionSetVisitor.Argument]) -> String? {
		var render: [String] = []
		for arg in arguments {
			let renderValue = renderTypeScriptArgumentValue(argumentValueType: arg.value)
			render.append("\(arg.name): \(renderValue)")
		}
		if render.isEmpty {
			return nil
		} else {
			return "{ \(render.joined(separator: ", ")) }"
		}
	}
	
	private func renderTypeScriptArgumentValue(argumentValueType: ArgumentValueType) -> String {
		var renders = ""
		
		switch argumentValueType {
		case let argumentValueType as SelectionSetVisitor.Variable:
			renders.append("{ type: \"OperationVariableKey\", value: \"\(argumentValueType.name)\" }")
		case let argumentValueType as SelectionSetVisitor.IntValue:
			renders.append("{ type: \"IntValue\", value: \(argumentValueType.value) }")
		case let argumentValueType as SelectionSetVisitor.FloatValue:
			renders.append("{ type: \"FloatValue\", value: \(argumentValueType.value) }")
		case let argumentValueType as SelectionSetVisitor.BooleanValue:
			renders.append("{ type: \"BooleanValue\", value: \(argumentValueType.value) }")
		case let argumentValueType as SelectionSetVisitor.EnumValue:
			renders.append("{ type: \"EnumValue\", value: \"\(argumentValueType.value)\" }")
		case let argumentValueType as SelectionSetVisitor.StringValue:
			renders.append("{ type: \"StringValue\", value: \"\(argumentValueType.value)\" }")
		case let argumentValueType as SelectionSetVisitor.ListValue:
			let values = argumentValueType.values
			var renderables: [String] = []
			for value in values {
				renderables.append(renderTypeScriptArgumentValue(argumentValueType: value))
			}
			
			renders.append("{ type: \"ListValue\", value: [\(renderables.joined(separator: ", "))] }")
		case let argumentValueType as SelectionSetVisitor.ObjectValue:
			let fields = argumentValueType.objectFields
			var renderables: [String] = []
			for field in fields {
				renderables.append("{ name: \"\(field.name)\", value: \(renderTypeScriptArgumentValue(argumentValueType: field.value))")
			}
			renders.append("{ type: \"ObjectValue\", value: [\(renderables.joined(separator: ", "))] }")
		default:
			renders.append("{ type: \"NullValue\", value: null }")
		}
		
		return renders
	}
	
	func renderTypeScriptTypeCondition(_ type: SelectionSetVisitor.TypeCondition) -> String {
		switch type {
		case .object(let name):
			return "{ name: \"\(name)\", definedType: \"Object\" }"
		case .interface(let name):
			return "{ name: \"\(name)\", definedType: \"Interface\" }"
		case .union(let name):
			return "{ name: \"\(name)\", definedType: \"Union\" }"
		case .scalar(let name):
			return "{ name: \"\(name)\", definedType: \"Scalar\" }"
		}
	}
	
	func renderSelectionArguments(_ selection: SelectionSetVisitor.Selection) -> String {
		if let field = selection.field {
			return renderArguments(field.arguments)
		}
		return ""
	}
	
	func renderGIDPassed(_ field: SelectionSetVisitor.Field) -> String {
		for argument in field.arguments {
			if argument.name == "id", let variable = argument.value as? SelectionSetVisitor.Variable {
				return "\"${operationVariables[\"\(variable.name)\"]}\""
			}
		}
		return "null"
	}
	
	func renderTypeScriptGIDPassed(_ field: SelectionSetVisitor.Field) -> String? {
		for argument in field.arguments {
			if argument.name == "id", let variable = argument.value as? SelectionSetVisitor.Variable {
				return "\"\(variable.name)\""
			}
		}
		
		return nil
	}
	
	func renderTypeScriptConditionalDirective(_ field: SelectionSetVisitor.Field) -> String? {
		if let skip = field.conditionalDirective?.skip {
			return "{ directiveType: \"skip\", value: \(renderTypeScriptArgumentValue(argumentValueType: skip)) }"
		} else if let include = field.conditionalDirective?.include {
			return "{ directiveType: \"include\", value: \(renderTypeScriptArgumentValue(argumentValueType: include)) }"
		}
		
		return nil
	}
	
	func renderConditionalDirective(_ field: SelectionSetVisitor.Field) -> String {
		if let skip = field.conditionalDirective?.skip as? SelectionSetVisitor.Variable {
			return "\"${operationVariables[\"\(skip.name)\"]}\".toBoolean()"
		} else if let include = field.conditionalDirective?.include as? SelectionSetVisitor.Variable {
			return "!\"${operationVariables[\"\(include.name)\"]}\".toBoolean()"
		}
		return "false"
	}
	
	func shouldPassTypeCondition(_ value: Any?) -> Bool {
		guard let typeCondition = value as? SelectionSetVisitor.TypeCondition else {
			return false
		}
		switch typeCondition {
		case .interface:
			return false
		case .object:
			return true
		case .union:
			return false
		case .scalar:
			return true
		}
	}
	
	func renderKotlinSelections(_ value: Any?, args: [Any?]) -> String {
		guard let selections = value as? [SelectionSetVisitor.Selection] else {
			return ""
		}
		let typeCondition = args.first as? String
		
		var fieldRenders: [String] = []
		var fragmentSpreadRenders: [String] = []
		
		var combinedSelections: [SelectionSetVisitor.Selection] = []
		
		for selection in selections {
			if selection.field != nil {
				combinedSelections.append(selection)
			} else if selection.inlineFragment != nil {
				combinedSelections += selection.inlineFragment?.selectionSet ?? []
			} else if selection.fragmentSpread != nil {
				combinedSelections.append(selection)
			}
		}
		
		for selection in combinedSelections {
			if let field = selection.field {
				if field.name != "__typename" {
					let name = field.alias ?? field.name
					var render = "\nSelection("
					render.append("\nname = \"\(name)\",")
					render.append("\ntype = \"\(renderKotlinTypeCondition(field.type))\",")
					render.append("\ncacheKey = \"\(name)\(renderArguments(field.arguments))\",")
					render.append("\npassedGID = \(renderGIDPassed(field)),")
					render.append("\ntypeCondition = \"\(renderKotlinTypeCondition(field.parentType))\",")
					render.append("\nshouldSkipBasedOnConditionalDirective = \(renderConditionalDirective(field)),")
					var typeConditionArgs: [String] = []
					if shouldPassTypeCondition(field.type) {
						typeConditionArgs = [renderKotlinTypeCondition(field.type)]
					}
					render.append("\nselections = \(renderKotlinSelections(field.selectionSet, args: typeConditionArgs))")
					render.append(")")
					fieldRenders.append(render)
				}
			}
			if let fragmentSpread = selection.fragmentSpread {
				fragmentSpreadRenders.append(fragmentSpread.name)
			}
		}
		var addFragmentSpreadRenders = ""
		var renderPassedTypeCondition = ""
		if let typeCondition = typeCondition {
			renderPassedTypeCondition = ".map { it.copy(typeCondition = \"\(typeCondition)\") }"
		}
		for fragmentSpread in fragmentSpreadRenders {
			addFragmentSpreadRenders += " + \(fragmentSpread).getSelections(operationVariables)" + renderPassedTypeCondition
		}
		return "listOf<Selection>(\((fieldRenders).joined(separator: ", ")))" + addFragmentSpreadRenders
	}
	
	func renderTypeScriptSelections(_ value: Any?, args: [Any?]) -> String? {
		guard let selections = value as? [SelectionSetVisitor.Selection] else {
			return "undefined"
		}
		
		let typeCondition = args.first as? String
		let spacingAmount = args[1] as? Int ?? 0
		let spacing = String(repeating: " ", count: spacingAmount)
		
		var fieldRenders: [String] = []
		var fragmentSpreadRenders: [String] = []
		
		var combinedSelections: [SelectionSetVisitor.Selection] = []
		
		for selection in selections {
			if selection.field != nil {
				combinedSelections.append(selection)
			} else if selection.inlineFragment != nil {
				combinedSelections += selection.inlineFragment?.selectionSet ?? []
			} else if selection.fragmentSpread != nil {
				combinedSelections.append(selection)
			}
		}
		
		for selection in combinedSelections {
			if let field = selection.field {
				var render = "\n\(spacing)  {"
				render.append("\n\(spacing)    name: \"\(field.name)\",")
				render.append("\n\(spacing)    type: \(renderTypeScriptTypeCondition(field.type)),")
				render.append("\n\(spacing)    typeCondition: \(renderTypeScriptTypeCondition(field.parentType)),")
				
				if let alias = field.alias {
					render.append("\n\(spacing)    alias: \(alias),")
				}
				
				if let renderedArguments = renderTypeScriptArguments(field.arguments) {
					render.append("\n\(spacing)    arguments: \(renderedArguments),")
				}
				
				if let renderedPassedGID = renderTypeScriptGIDPassed(field) {
					render.append("\n\(spacing)    passedGID: \(renderedPassedGID),")
				}

				if let renderedDirective = renderTypeScriptConditionalDirective(field) {
					render.append("\n\(spacing)    directive: \(renderedDirective),")
				}
				
				let nextSpacingAmount = spacingAmount+4
				let arguments: [Any?]
				
				if shouldPassTypeCondition(field.type) {
					arguments = [renderTypeScriptTypeCondition(field.type), nextSpacingAmount]
				} else {
					arguments = [nil, nextSpacingAmount]
				}
				
				if let renderedSelections = renderTypeScriptSelections(field.selectionSet, args: arguments) {
					render.append("\n\(spacing)    selections: \(renderedSelections)")
				}

				render.append("\n\(spacing)  }")
				
				fieldRenders.append(render)
			}
			
			if let fragmentSpread = selection.fragmentSpread {
				fragmentSpreadRenders.append(fragmentSpread.name)
			}
		}
		
		var addFragmentSpreadRenders = ""
		var renderPassedTypeCondition = ""
		
		if let typeCondition = typeCondition {
			renderPassedTypeCondition = ".map(x => copyWithTypeCondition(x, \(typeCondition)))"
		}
		
		for fragmentSpread in fragmentSpreadRenders {
			addFragmentSpreadRenders += ".concat(\(fragmentSpread.lowercasedFirstLetter)Selections)" + renderPassedTypeCondition
		}
		
		if (fieldRenders.isEmpty) {
			if (addFragmentSpreadRenders.isEmpty) {
				return nil
			} else {
				return "([] as GraphSelection[])" + addFragmentSpreadRenders
			}
		} else {
			return "([\((fieldRenders).joined(separator: ", "))\n\(spacing)] as GraphSelection[])" + addFragmentSpreadRenders
		}
	}
}
