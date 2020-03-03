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

public protocol ScalarType {
	var graphType: String { get }
	var nativeType: String { get }
}

protocol NamedItem {
	var name: String { get }
}

struct IntermediateRepresentation {
	static let typeNameField = "__typename"
	
	enum Selection {
		case field(Field)
		case fragmentSpread(FragmentSpread)
		case inlineFragment(InlineFragment)
	}
	
	enum ParentType: Equatable {
		case query(String), mutation(String), fragment(String)
		
		var name: String {
			switch self {
			case .query(let name), .mutation(let name), .fragment(let name):
				return name
			}
		}
		
		static func ==(lhs: ParentType, rhs: ParentType) -> Bool {
			switch (lhs, rhs) {
			case (.query(let lhsName), .query(let rhsName)):
				return lhsName == rhsName
			case (.mutation(let lhsName), .mutation(let rhsName)):
				return lhsName == rhsName
			case (.fragment(let lhsName), .fragment(let rhsName)):
				return lhsName == rhsName
			default:
				return false
			}
		}
	}
	
	struct Attributes {
		let description: String?
		let isDeprecated: Bool
		let deprecationReason: String?
		
		public init(description: String? = nil, isDeprecated: Bool = false, deprecationReason: String? = nil) {
			self.description = description
			self.isDeprecated = isDeprecated
			self.deprecationReason = deprecationReason
		}
		
		init(field: Schema.Field) {
			self.init(description: field.description, isDeprecated: field.isDeprecated, deprecationReason: field.deprecationReason)
		}
	}
	
	struct Field {
		let name: String
		let type: FieldType
		let attributes: Attributes
		let hasConditionalDirective: Bool
		let referencedVariables: [String]
	}
	
	struct FragmentSpread {
		let name: String
		let typeCondition: TypeCondition
		let hasConditionalDirective: Bool
	}
	
	struct InlineFragment {
		let typeCondition: TypeCondition
		let selectionSet: [Selection]
		let hasConditionalDirective: Bool
	}
	
	enum TypeCondition: Equatable, Hashable {
		case interface(String)
		case object(String)
		case union(String)
		
		var name: String {
			switch self {
			case .interface(let name), .object(let name), .union(let name):
				return name
			}
		}
	}
	
	indirect enum FieldType {
		case scalar(ScalarType)
		case nonNull(FieldType)
		case list(FieldType)
		case object(Object)
		case `enum`(String)
		case interface(Interface)
		case union(Union)
		
		func nestedObject() -> Object? {
			switch self {
			case .object(let object):
				return object
			case .list(let nestedType), .nonNull(let nestedType):
				return nestedType.nestedObject()
			case .scalar, .enum, .interface, .union:
				return nil
			}
		}
		
		func nestedInterface() -> Interface? {
			switch self {
			case .interface(let interface):
				return interface
			case .list(let nestedType), .nonNull(let nestedType):
				return nestedType.nestedInterface()
			case .scalar, .enum, .object, .union:
				return nil
			}
		}
		
		func nestedUnion() -> Union? {
			switch self {
			case .union(let union):
				return union
			case .list(let nestedType), .nonNull(let nestedType):
				return nestedType.nestedUnion()
			case .scalar, .enum, .object, .interface:
				return nil
			}
		}
		
		func nestedScalar() -> ScalarType? {
			switch self {
			case .scalar(let scalar):
				return scalar
			case .list(let nested), .nonNull(let nested):
				return nested.nestedScalar()
			case .object, .enum, .interface, .union:
				return nil
			}
		}
		
		func isList() -> Bool {
			switch self {
			case .list:
				return true
			case .nonNull(let nested):
				return nested.isList()
			case .object, .scalar, .enum, .interface, .union:
				return false
			}
		}
		
		var graphQLName: String {
			switch self {
			case .list(let nested), .nonNull(let nested):
				return nested.graphQLName
			case .object(let object):
				return object.graphQLTypeName
			case .interface(let interface):
				return interface.graphQLTypeName
			case .union(let union):
				return union.graphQLTypeName
			case .scalar(let scalar):
				return scalar.graphType
			case .enum(let name):
				return name
			}
		}
	}
	
	struct Object {
		let graphQLTypeName: String
		let selectionSet: [Selection]
	}
	
	struct Interface {
		let graphQLTypeName: String
		let selectionSet: [Selection]
	}
	
	struct Union {
		let graphQLTypeName: String
		let selectionSet: [Selection]
	}
	
	struct OperationDefinition: NamedItem {
		let name: String
		let selections: [Selection]
		let typeName: String
		let type: OperationType
		let variables: [IntermediateRepresentation.Variable]
		let operation: String
	}
	
	enum OperationType {
		case query, mutation
	}
	
	struct FragmentDefinition: NamedItem {
		let name: String
		let typeCondition: TypeCondition
		let selections: [Selection]
		let query: String
	}
	
	struct Variable {
		let name: String
		let type: VariableType
		
		indirect enum VariableType {
			case scalar(ScalarType)
			case `enum`(String)
			case input(String)
			case list(VariableType)
			case nonNull(VariableType)
			
			func nestedScalar() -> ScalarType? {
				switch self {
				case .scalar(let scalar):
					return scalar
				case .list(let nested), .nonNull(let nested):
					return nested.nestedScalar()
				case .input, .enum:
					return nil
				}
			}
			
			func isList() -> Bool {
				switch self {
				case .list:
					return true
				case .nonNull(let nested):
					return nested.isList()
				case .scalar, .enum, .input:
					return false
				}
			}
		}
	}
	
	struct InputType: Hashable, NamedItem {
		let name: String
		let inputFields: [Variable]
		let attributes: Attributes
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(name)
		}
		
		static func ==(lhs: InputType, rhs: InputType) -> Bool {
			return lhs.name == rhs.name
		}
	}
	
	struct EnumType: Hashable, NamedItem {
		struct Value: Hashable {
			let value: String
			let attributes: Attributes
			
			func hash(into hasher: inout Hasher) {
				hasher.combine(value)
			}
			
			static func ==(lhs: Value, rhs: Value) -> Bool {
				return lhs.value == rhs.value
			}
		}
		let name: String
		let values: [Value]
		let attributes: Attributes
		
		func hash(into hasher: inout Hasher) {
			hasher.combine(name)
			hasher.combine(values)
		}
		
		static func ==(lhs: EnumType, rhs: EnumType) -> Bool {
			return lhs.name == rhs.name && lhs.values == rhs.values
		}
	}
	
	struct CustomScalar: ScalarType {
		let graphType: String
		let nativeType: String
	}
	
	struct CustomCodedScalar: ScalarType {
		let graphType: String
		let nativeType: String
		let rawValueType: String
	}
	
	let operations: [OperationDefinition]
	let fragmentDefinitions: [FragmentDefinition]
	let referencedEnums: [EnumType]
	let referencedInputTypes: [InputType]
	
	func fullQueryString(for operation: OperationDefinition) -> String {
		let fragmentNames = operation.selections.flatMap { referencedFragmentNames(on: $0) }.unique
		let referencedFragments = fragmentNames.map {
			fragmentDefinitions[$0].query
		}
		return (referencedFragments + [operation.operation]).joined(separator: "\n")
	}
	
	func referencedFragmentNames(on selection: Selection) -> [String] {
		switch selection {
		case .field(let field):
			if let nestedSelections = field.type.nestedObject()?.selectionSet {
				return nestedSelections.flatMap { referencedFragmentNames(on: $0) }.unique
			} else if let nestedSelections = field.type.nestedInterface()?.selectionSet {
				return nestedSelections.flatMap { referencedFragmentNames(on: $0) }.unique
			} else if let nestedSelections = field.type.nestedUnion()?.selectionSet {
				return nestedSelections.flatMap { referencedFragmentNames(on: $0) }.unique
			}
			return []
		case .fragmentSpread(let fragmentSpread):
			let nested = fragmentDefinitions[fragmentSpread.name].selections.flatMap { referencedFragmentNames(on: $0) }
			return ([fragmentSpread.name] + nested).unique
		case .inlineFragment(let inlineFragment):
			return inlineFragment.selectionSet.flatMap { referencedFragmentNames(on: $0) }.unique
		}
	}
}

private extension Array where Element == IntermediateRepresentation.FragmentDefinition {
	subscript(index: String) -> IntermediateRepresentation.FragmentDefinition {
		get {
			return self.first(where: { (fragmentDefinition) -> Bool in
				fragmentDefinition.name == index
			})!
		}
		set(newValue) {}
	}
}

extension Array where Element == IntermediateRepresentation.OperationDefinition {
	var mutations: [IntermediateRepresentation.OperationDefinition] {
		return filter {
			if case .mutation = $0.type {
				return true
			} else {
				return false
			}
		}
	}
	
	var queries: [IntermediateRepresentation.OperationDefinition] {
		return filter {
			if case .query = $0.type {
				return true
			} else {
				return false
			}
		}
	}
}
