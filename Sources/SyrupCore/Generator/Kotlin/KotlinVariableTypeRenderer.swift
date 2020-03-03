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

struct KotlinVariableTypeRenderer: VariableTypeRenderer {
	static func render(variableType: IntermediateRepresentation.Variable.VariableType) -> String {
		return render(variableType: variableType, nonNull: false, inputVariable: false)
	}
	
	static func render(inputVariableType: IntermediateRepresentation.Variable.VariableType) -> String {
		return render(variableType: inputVariableType, nonNull: false, inputVariable: true)
	}
	
	private static func render(variableType: IntermediateRepresentation.Variable.VariableType, nonNull: Bool, inputVariable: Bool) -> String {
		switch variableType {
		case .nonNull(let wrappedType):
			return render(variableType: wrappedType, nonNull: true, inputVariable: inputVariable)
		case .list(let wrappedType):
			let rendered = "List<" + render(variableType: wrappedType, nonNull: false, inputVariable: inputVariable) + ">"
			if nonNull {
				return rendered
			} else if inputVariable {
				return "Input<\(rendered)>"
			} else {
				return rendered + "?"
			}
		case .enum(let name):
			if nonNull {
				return name
			} else if inputVariable {
				return "Input<\(name)>"
			} else {
				return name + "?"
			}
		case .input(let name):
			if nonNull {
				return name
			} else if inputVariable {
				return "Input<\(name)>"
			} else {
				return name + "?"
			}
		case .scalar(let scalarType):
			if nonNull {
				return scalarType.nativeType
			} else if inputVariable {
				return "Input<\(scalarType.nativeType)>"
			} else {
				return scalarType.nativeType + "?"
			}
		}
	}
	
}
