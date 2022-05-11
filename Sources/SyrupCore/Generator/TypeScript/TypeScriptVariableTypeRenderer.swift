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

enum TypeScriptVariableTypeRenderer: VariableTypeRenderer {
	static func render(variableType: IntermediateRepresentation.Variable.VariableType) -> String {
		render(variableType: variableType, parentType: nil)
	}
	
	static func render(inputVariableType: IntermediateRepresentation.Variable.VariableType) -> String {
		render(variableType: inputVariableType, parentType: nil)
	}
	
	private static func render(variableType: IntermediateRepresentation.Variable.VariableType, parentType: IntermediateRepresentation.Variable.VariableType?) -> String {
		switch variableType {
		case .nonNull(let wrappedType):
			return render(variableType: wrappedType, parentType: variableType)
		case .list(let wrappedType):
			let rendered: String = render(variableType: wrappedType, parentType: variableType)
			
			switch wrappedType {
			case .nonNull:
				return "\(rendered)[]"
			default:
				return "(\(rendered))[]"
			}
		case .enum(let name):
			return buildVariableType(rendered: name, variableType: parentType)
		case .input(let name):
			return buildVariableType(rendered: name, variableType: parentType)
		case .scalar(let scalarType):
			return buildVariableType(rendered: scalarType.nativeType, variableType: parentType)
		}
	}
	
	private static func buildVariableType(rendered: String, variableType: IntermediateRepresentation.Variable.VariableType?) -> String {
		switch variableType {
		case .nonNull:
			return rendered
		default:
			return "\(rendered) | null"
		}
	}
}
