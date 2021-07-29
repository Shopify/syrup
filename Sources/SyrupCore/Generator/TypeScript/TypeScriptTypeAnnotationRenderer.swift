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

enum TypeScriptTypeAnnotationRenderer {
	
	static func render(scalarField: IntermediateRepresentation.CollectedScalarField, outsideOfModule moduleName: String? = nil) -> String {
		render(scalarType: scalarField.type, parentType: nil, moduleName: moduleName)
	}
	
	private static func render(scalarType: FieldTypeProtocol, parentType: FieldTypeProtocol?, moduleName: String?) -> String {
		let rendered: String
		switch scalarType {
		case let enumType as IntermediateRepresentation.EnumFieldType:
			let name = enumType.name
			rendered = "\(name)"
		case let scalarType as IntermediateRepresentation.ScalarFieldType:
			rendered = scalarType.scalar.nativeType
		case let listType as IntermediateRepresentation.ListFieldType:
			rendered = "\(render(scalarType: listType.elementType, parentType: listType, moduleName: moduleName))[]"
		case let nonNullType as IntermediateRepresentation.NonNullFieldType:
			return render(scalarType: nonNullType.nestedType, parentType: nonNullType, moduleName: moduleName)
		default:
			fatalError("Encountered unexpected type \(scalarType)")
		}
		if parentType is IntermediateRepresentation.NonNullFieldType {
			return rendered
		} else {
			let nullableRender = "\(rendered) | null"
			
			if parentType is IntermediateRepresentation.ListFieldType {
				return "(\(nullableRender))"
			} else {
				return nullableRender
			}
		}
	}
	
	static func render(interfaceWrapper: IntermediateRepresentation.CollectedInterfaceField, prefix: String? = nil) -> String {
		return render(objectType: interfaceWrapper.type, parentType: nil, name: buildPrefixedString(name: interfaceWrapper.name, prefix: prefix))
	}
	
	static func render(unionWrapper: IntermediateRepresentation.CollectedUnionField, prefix: String? = nil) -> String {
		return render(objectType: unionWrapper.type, parentType: nil, name: buildPrefixedString(name: unionWrapper.name, prefix: prefix))
	}
	
	static func render(objectField: IntermediateRepresentation.CollectedObjectField, prefix: String? = nil) -> String {
		return render(objectType: objectField.type, parentType: nil, name: buildPrefixedString(name: objectField.name, prefix: prefix))
	}
	
	private static func render(objectType: FieldTypeProtocol, parentType: FieldTypeProtocol?, name: String) -> String {
		let rendered: String
		switch objectType {
		case is IntermediateRepresentation.ObjectFieldType, is IntermediateRepresentation.InterfaceFieldType, is IntermediateRepresentation.UnionFieldType:
			rendered = name.capitalizedFirstLetter
		case let listType as IntermediateRepresentation.ListFieldType:
			rendered = "\(render(objectType: listType.elementType, parentType: listType, name: name.capitalizedFirstLetter))[]"
		case let nonNullType as IntermediateRepresentation.NonNullFieldType:
			return render(objectType: nonNullType.nestedType, parentType: nonNullType, name: name)
		default:
			fatalError("Encountered unexpected type \(objectType)")
		}
		if parentType is IntermediateRepresentation.NonNullFieldType {
			return rendered
		} else {
			let nullableRender = "\(rendered) | null"
			
			if parentType is IntermediateRepresentation.ListFieldType {
				return "(\(nullableRender))"
			} else {
				return nullableRender
			}
		}
	}
	
	private static func buildPrefixedString(name: String, prefix: String?) -> String {
		if let prefix = prefix {
			return "\(prefix.capitalizedFirstLetter)\(name.capitalizedFirstLetter)"
		} else {
			return name.capitalizedFirstLetter
		}
	}
}
