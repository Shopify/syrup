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

struct Schema: Decodable {
	private let queryTypeName: String
	private let mutationTypeName: String?
	let types: [SchemaType]
	let directives: [Directive]
	
	var queryType: SchemaType {
		return self.type(named: queryTypeName)
	}
	
	var mutationType: SchemaType? {
		guard let mutationTypeName = mutationTypeName else { return nil }
		return self.type(named: mutationTypeName)
	}
	
	enum DataKey: String, CodingKey {
		case data
	}
	
	enum SchemaKey: String, CodingKey {
		case schema = "__schema"
	}
	
	enum CodingKeys: String, CodingKey {
		case queryType
		case mutationType
		case types
		case directives
	}
	
	enum NameKey: String, CodingKey {
		case name
	}
	
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: DataKey.self).nestedContainer(keyedBy: SchemaKey.self, forKey: .data).nestedContainer(keyedBy: CodingKeys.self, forKey: .schema)
		queryTypeName = try values.nestedContainer(keyedBy: NameKey.self, forKey: .queryType).decode(String.self, forKey: .name)
		if try values.decodeNil(forKey: .mutationType) {
			mutationTypeName = nil
		} else {
			mutationTypeName = try values.nestedContainer(keyedBy: NameKey.self, forKey: .mutationType).decode(String.self, forKey: .name)
		}
		types = try values.decode([SchemaType].self, forKey: .types)
		directives = try values.decode([Directive].self, forKey: .directives)
	}
	
	func type(named name: String) -> SchemaType {
		guard let type = types.first(where: { $0.name == name }) else {
			fatalError("Unable to find type named \(name) on schema")
		}
		return type
	}
	
	func topLevelType(of fieldName: String, on type: SchemaType) -> SchemaType {
		let field = type.field(named: fieldName)
		let typeName = field.unwrappedType.name
		let type = self.type(named: typeName)
		return type
	}
	
	class SchemaType: Decodable {
		let kind: TypeKind
		
		private let internalName: String?
		var name: String {
			switch self.kind {
			case .enum, .object, .scalar, .interface, .union, .inputObject:
				guard let name = internalName else {
					fatalError("Property 'name' must have a value on type of kind \(self.kind)")
				}
				return name
			case .list, .nonNull:
				fatalError("Property 'name' will always be null on type of kind \(self.kind)")
			}
		}
		
		let description: String?
		let fields: [Field]?
		let interfaces: [SchemaType]?
		let possibleTypes: [SchemaType]?
		
		private let internalEnumValues: [EnumValue]?
		var enumValues: [EnumValue] {
			switch self.kind {
			case .enum:
				guard let enumValues = internalEnumValues else {
					fatalError("Property 'enumValues' must have a value on type of kind \(self.kind)")
				}
				return enumValues
			default:
				fatalError("Property 'enumValues' will always be null on type of kind \(self.kind)")
			}
		}
		
		private let internalInputFields: [InputValue]?
		var inputFields: [InputValue] {
			switch self.kind {
			case .inputObject:
				guard let inputFields = internalInputFields else {
					fatalError("Property 'inputFields' must have a value on type of kind \(self.kind)")
				}
				return inputFields
			default:
				fatalError("Property 'inputFields' will always be null on type of kind \(self.kind)")
			}
		}
		
		private let internalOfType: SchemaType?
		var ofType: SchemaType {
			switch self.kind {
			case .list, .nonNull:
				guard let type = internalOfType else {
					fatalError("Property 'ofType' must have a value on type of kind \(self.kind)")
				}
				return type
			case .enum, .object, .scalar, .interface, .union, .inputObject:
				fatalError("Property 'ofType' will always be null on type of kind \(self.kind)")
			}
		}
		
		init() {
			fatalError("Not meant to be initialized directly")
		}
		
		func field(named name: String) -> Field {
			guard let fields = fields, let field = fields.first(where: { $0.name == name }) else {
				fatalError("Unable to find field named \(name) on type named \(self.name)")
			}
			return field
		}
		
		func isInterfaceType() -> Bool {
			switch kind {
			case .interface:
				return true
			case .nonNull, .list:
				return ofType.isInterfaceType()
			case .enum, .inputObject, .object, .scalar, .union:
				return false
			}
		}
		
		func isUnionType() -> Bool {
			switch kind {
			case .union:
				return true
			case .nonNull, .list:
				return ofType.isInterfaceType()
			case .enum, .inputObject, .object, .scalar, .interface:
				return false
			}
		}
		
		func isObjectType() -> Bool {
			switch kind {
			case .object:
				return true
			case .nonNull, .list:
				return ofType.isInterfaceType()
			case .enum, .inputObject, .interface, .scalar, .union:
				return false
			}
		}
		
		enum CodingKeys: String, CodingKey {
			case kind
			case internalName = "name"
			case description
			case fields
			case interfaces
			case possibleTypes
			case internalEnumValues = "enumValues"
			case internalInputFields = "inputFields"
			case internalOfType = "ofType"
		}
	}
	
	enum TypeKind: String, Decodable {
		case scalar = "SCALAR"
		case object = "OBJECT"
		case interface = "INTERFACE"
		case union = "UNION"
		case `enum` = "ENUM"
		case inputObject = "INPUT_OBJECT"
		case list = "LIST"
		case nonNull = "NON_NULL"
	}
	
	struct Field: Decodable {
		let name: String
		let description: String?
		let args: [InputValue]
		let type: SchemaType
		let isDeprecated: Bool
		let deprecationReason: String?
		
		var unwrappedType: SchemaType {
			var unwrapped = self.type
			func isListOrNonNull(kind: TypeKind) -> Bool {
				if case .list = kind {
					return true
				} else if case .nonNull = kind {
					return true
				}
				return false
			}
			while isListOrNonNull(kind: unwrapped.kind) {
				unwrapped = unwrapped.ofType
			}
			return unwrapped
		}
	}
	
	struct InputValue: Decodable {
		let name: String
		let description: String?
		let type: SchemaType
		let defaultValue: String?
	}
	
	struct EnumValue: Decodable {
		let name: String
		let description: String?
		let isDeprecated: Bool
		let deprecationReason: String?
	}
	
	struct Directive: Decodable {
		let name: String
		let description: String?
		let locations: [DirectiveLocation]
		let args: [InputValue]
	}
	
	enum DirectiveLocation: String, Decodable {
		case query = "QUERY"
		case mutation = "MUTATION"
		case subscription = "SUBSCRIPTION"
		case field = "FIELD"
		case fragmentDefinition = "FRAGMENT_DEFINITION"
		case fragmentSpread = "FRAGMENT_SPREAD"
		case inlineFragment = "INLINE_FRAGMENT"
		case schema = "SCHEMA"
		case scalar = "SCALAR"
		case object = "OBJECT"
		case fieldDefinition = "FIELD_DEFINITION"
		case argumentDefinition = "ARGUMENT_DEFINITION"
		case interface = "INTERFACE"
		case union = "UNION"
		case `enum` = "ENUM"
		case enumValue = "ENUM_VALUE"
		case inputObject = "INPUT_OBJECT"
		case inputFieldDefinition = "INPUT_FIELD_DEFINITION"
	}
}
