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
}
