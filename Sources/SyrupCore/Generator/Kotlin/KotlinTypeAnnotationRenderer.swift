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

enum KotlinTypeAnnotationRenderer {
	
	static func render(scalarField: IntermediateRepresentation.CollectedScalarField, outsideOfModule moduleName: String? = nil) -> String {
		render(scalarType: scalarField.type, nonNull: false, moduleName: moduleName)
	}
	
	private static func render(scalarType: FieldTypeProtocol, nonNull: Bool, moduleName: String?) -> String {
		let rendered: String
		switch scalarType {
		case let enumType as IntermediateRepresentation.EnumFieldType:
			let name = enumType.name
			if let moduleName = moduleName {
				rendered = "\(moduleName).\(name)"
			} else {
				rendered = name
			}
		case let scalarType as IntermediateRepresentation.ScalarFieldType:
			rendered = scalarType.scalar.nativeType
		case let listType as IntermediateRepresentation.ListFieldType:
			rendered = "ArrayList<\(render(scalarType: listType.elementType, nonNull: false, moduleName: moduleName))>"
		case let nonNullType as IntermediateRepresentation.NonNullFieldType:
			return render(scalarType: nonNullType.nestedType, nonNull: true, moduleName: moduleName)
		default:
			fatalError("Encountered unexpected type \(scalarType)")
		}
		if nonNull {
			return rendered
		} else {
			return "\(rendered)?"
		}
	}
	
	static func render(interfaceWrapper: IntermediateRepresentation.CollectedInterfaceField, prefix: String? = nil) -> String {
		var name = interfaceWrapper.name.capitalizedFirstLetter
		if let prefix = prefix {
			name = "\(prefix).\(name)"
		}
		return render(objectType: interfaceWrapper.type, nonNull: false, name: name)
	}
	
	static func render(unionWrapper: IntermediateRepresentation.CollectedUnionField, prefix: String? = nil) -> String {
		var name = unionWrapper.name.capitalizedFirstLetter
		if let prefix = prefix {
			name = "\(prefix).\(name)"
		}
		return render(objectType: unionWrapper.type, nonNull: false, name: name)
	}
	
	static func render(objectField: IntermediateRepresentation.CollectedObjectField, prefix: String? = nil) -> String {
		var name = objectField.name.capitalizedFirstLetter
		if let prefix = prefix {
			name = "\(prefix).\(name)"
		}
		return render(objectType: objectField.type, nonNull: false, name: name)
	}
	
	private static func render(objectType: FieldTypeProtocol, nonNull: Bool, name: String) -> String {
		let rendered: String
		switch objectType {
		case is IntermediateRepresentation.ObjectFieldType, is IntermediateRepresentation.InterfaceFieldType, is IntermediateRepresentation.UnionFieldType:
			rendered = name.capitalizedFirstLetter
		case let listType as IntermediateRepresentation.ListFieldType:
			rendered = "ArrayList<\(render(objectType: listType.elementType, nonNull: false, name: name.capitalizedFirstLetter))>"
		case let nonNullType as IntermediateRepresentation.NonNullFieldType:
			return render(objectType: nonNullType.nestedType, nonNull: true, name: name)
		default:
			fatalError("Encountered unexpected type \(objectType)")
		}
		if nonNull {
			return rendered
		} else {
			return "\(rendered)?"
		}
	}
	
}
