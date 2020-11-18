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

protocol FieldTypeProtocol {
	var graphQLName: String { get }
}

extension FieldTypeProtocol {
	var isList: Bool {
		if self is IntermediateRepresentation.ListFieldType {
			return true
		} else if let fieldType = self as? IntermediateRepresentation.NonNullFieldType {
			return fieldType.nestedType.isList
		}
		return false
	}
	
	var isNonNull: Bool {
		self is IntermediateRepresentation.NonNullFieldType
	}
	
	var isObject: Bool {
		if self is IntermediateRepresentation.ObjectFieldType {
			return true
		} else if let fieldType = self as? IntermediateRepresentation.NonNullFieldType {
			return fieldType.nestedType.isObject
		} else if let fieldType = self as? IntermediateRepresentation.ListFieldType {
			return fieldType.elementType.isObject
		}
		return false
	}
	
	var isInterface: Bool {
		if self is IntermediateRepresentation.InterfaceFieldType {
			return true
		} else if let fieldType = self as? IntermediateRepresentation.NonNullFieldType {
			return fieldType.nestedType.isInterface
		} else if let fieldType = self as? IntermediateRepresentation.ListFieldType {
			return fieldType.elementType.isInterface
		}
		return false
	}
	
	var isUnion: Bool {
		if self is IntermediateRepresentation.UnionFieldType {
			return true
		} else if let fieldType = self as? IntermediateRepresentation.NonNullFieldType {
			return fieldType.nestedType.isUnion
		} else if let fieldType = self as? IntermediateRepresentation.ListFieldType {
			return fieldType.elementType.isUnion
		}
		return false
	}
	
	var nestedScalar: ScalarType? {
		if let fieldType = self as? IntermediateRepresentation.ScalarFieldType {
			return fieldType.scalar
		} else if let fieldType = self as? IntermediateRepresentation.ListFieldType {
			return fieldType.elementType.nestedScalar
		} else if let fieldType = self as? IntermediateRepresentation.NonNullFieldType {
			return fieldType.nestedType.nestedScalar
		}
		return nil
	}
}

extension IntermediateRepresentation {
	struct ScalarFieldType: FieldTypeProtocol {
		let scalar: ScalarType
		let graphQLName: String
		
		init(scalar: ScalarType) {
			self.scalar = scalar
			self.graphQLName = scalar.graphType
		}
	}
	
	struct ListFieldType: FieldTypeProtocol {
		let elementType: FieldTypeProtocol
		let graphQLName: String
		
		init(elementType: FieldTypeProtocol) {
			self.elementType = elementType
			self.graphQLName = elementType.graphQLName
		}
	}
	
	struct NonNullFieldType: FieldTypeProtocol {
		let nestedType: FieldTypeProtocol
		let graphQLName: String
		
		init(nestedType: FieldTypeProtocol) {
			self.nestedType = nestedType
			self.graphQLName = nestedType.graphQLName
		}
	}
	
	struct ObjectFieldType: FieldTypeProtocol {
		let graphQLName: String
		
		init(graphQLName: String) {
			self.graphQLName = graphQLName
		}
	}
	
	struct EnumFieldType: FieldTypeProtocol {
		let name: String
		let graphQLName: String
		
		init(graphQLName: String) {
			self.name = graphQLName
			self.graphQLName = graphQLName
		}
	}
	
	struct InterfaceFieldType: FieldTypeProtocol {
		let graphQLName: String
		
		init(graphQLName: String) {
			self.graphQLName = graphQLName
		}
	}
	
	struct UnionFieldType: FieldTypeProtocol {
		let graphQLName: String
		
		init(graphQLName: String) {
			self.graphQLName = graphQLName
		}
	}
}

extension IntermediateRepresentation.FieldType {
	func fieldTypeProtocol() -> FieldTypeProtocol {
		switch self {
		case .nonNull(let nestedType):
			return IntermediateRepresentation.NonNullFieldType(nestedType: nestedType.fieldTypeProtocol())
		case .list(let nestedType):
			return IntermediateRepresentation.ListFieldType(elementType: nestedType.fieldTypeProtocol())
		case .object(let object):
			return IntermediateRepresentation.ObjectFieldType(graphQLName: object.graphQLTypeName)
		case .interface(let interface):
			return IntermediateRepresentation.InterfaceFieldType(graphQLName: interface.graphQLTypeName)
		case .union(let union):
			return IntermediateRepresentation.UnionFieldType(graphQLName: union.graphQLTypeName)
		case .enum(let `enum`):
			return IntermediateRepresentation.EnumFieldType(graphQLName: `enum`)
		case .scalar(let scalar):
			return IntermediateRepresentation.ScalarFieldType(scalar: scalar)
		}
	}
}
