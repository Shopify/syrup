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

final class ArgumentRendererExtension<V: VariableTypeRenderer>: Extension {
	private let reservedWords: [String]
	private let null: String
	
	init(reservedWords: [String], null: String) {
		self.reservedWords = reservedWords
		self.null = null
		super.init()
		
		registerFilter("renderArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				var rendered = "\(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords)): \(V.render(variableType: variable.type))"
				switch variable.type {
				case .nonNull:
					break
				default:
					rendered += " = \(null)"
				}
				return rendered
			}
			return result.joined(separator: ", ")
		}
		
		registerFilter("renderKotlinArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				var rendered = "var \(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords)): \(V.render(variableType: variable.type))"
				switch variable.type {
				case .nonNull:
					break
				default:
					rendered += " = \(null)"
				}
				return rendered
			}
			return result.joined(separator: ", ")
		}
		
		registerFilter("renderKotlinOperationVariables") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				let rendered = "\"\(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords))\" to \"$\(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords))\""
				return rendered
			}
			return result.joined(separator: ",\n")
		}
		
		registerFilter("renderKotlinInputArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				var rendered = "var \(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords)): InputWrapper<\(V.render(variableType: variable.type))>"
				switch variable.type {
				case .nonNull:
					break
				default:
					rendered += " = InputWrapper()"
				}
				return rendered
			}
			return result.joined(separator: ", ")
		}
		
		registerFilter("renderKotlinVariableType") { (value) -> Any? in
			guard let variable = value as? IntermediateRepresentation.Variable else { return nil }
			let rendered = "\(V.render(variableType: variable.type))"
			return rendered
			
		}
		
		registerFilter("renderTypeScriptArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				var rendered = "\(TypeScriptReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords))"
				switch variable.type {
				case .nonNull:
					break
				default:
					rendered += "?"
				}
				return rendered + ": \(V.render(variableType: variable.type));"
			}
			return result.joined(separator: "\n    ")
		}
		
		registerFilter("renderTypeScriptInputArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				return "\(TypeScriptReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords))?: \(V.render(variableType: variable.type));"
			}
			return result.joined(separator: "\n  ")
		}
		
		registerFilter("renderInputArguments") { (value) -> Any? in
			guard let variables = value as? [IntermediateRepresentation.Variable] else { return nil }
			let result: [String] = variables.map { variable in
				var rendered = "\(ReservedWordsExtension.escape(word: variable.name, reservedWords: reservedWords)): \(V.render(inputVariableType: variable.type))"
				switch variable.type {
				case .nonNull:
					break
				default:
					rendered += " = .undefined"
				}
				return rendered
			}
			return result.joined(separator: ", ")
		}
	}
}
