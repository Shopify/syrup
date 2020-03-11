// Syrup auto-generated file
import Foundation
#if !os(Linux)
import os
#endif

public protocol GraphApiQuery: Encodable, CustomStringConvertible {
	var queryString: String { get }
	static var customEncoder: JSONEncoder { get }
	static var errorLogger: GraphApiLogger? { get }
	static var operationSelections: GraphSelections.Operation? { get }
}

public protocol ResponseAssociable {
	associatedtype Response: GraphApiResponse
}

public extension GraphApiQuery {
	var description: String {
		let encoder = Self.customEncoder
		let data = try! encoder.encode(self)
		let varString = String(data: data, encoding: .utf8)!
		return self.queryString + varString
	}
	var variables: [String: Any] {
		do {
			let encoder = Self.customEncoder
			let data = try encoder.encode(self)
			let jsonObject = try JSONSerialization.jsonObject(with: data)
			guard let variables = jsonObject as? [String: Any] else {
				return [:]
			}
			return variables
		} catch {
#if !os(Linux)
			Self.logger.logError("Error %s when serializing variables of %s", fileName: #file, functionName: #function, lineNumber: #line, error.localizedDescription, String(describing: Self.self))
#endif
			return [:]
		}
	}
}

public protocol GraphApiResponse: Codable {
	static var customDecoder: JSONDecoder { get }
	static var customEncoder: JSONEncoder { get }
	static var errorLogger: GraphApiLogger? { get }
}

public extension GraphApiResponse {
	init(from fields: [String: Any]) throws {
		let decoder = Self.customDecoder
		let data = try JSONSerialization.data(withJSONObject: fields)
		self = try decoder.decode(Self.self, from: data)
	}

	func fields(collapsingFragments: Bool = true) -> [String: Any] {
		do {
			let encoder = Self.customEncoder
			let data = try encoder.encode(self)
			let jsonObject = try JSONSerialization.jsonObject(with: data)
			guard let fields = jsonObject as? [String: Any] else {
				return [:]
			}
			if collapsingFragments {
				return collapseFragments(from: fields)
			} else {
				return fields
			}
		} catch {
#if !os(Linux)
			Self.logger.logError("Error %s when serializing %s to fields", fileName: #file, functionName: #function, lineNumber: #line, error.localizedDescription, String(describing: Self.self))
#endif
			return [:]
		}
	}
}

public protocol GraphModule {
	static var customDecoder: JSONDecoder { get }
	static var customEncoder: JSONEncoder { get }
	associatedtype CustomScalarResolverType
	static var customScalarResolver: CustomScalarResolverType { get }
}

public protocol GraphApiLogger {
	func logError(_ message: StaticString, fileName file: StaticString, functionName function: StaticString, lineNumber line: Int, _ args: CVarArg...)
}

open class BaseCustomScalarResolver {
	public struct ResolverError: Error {
		public let type: Any.Type
	}

	public init() {}

	public func decode<T, R: Decodable, K>(_ type: T.Type, rawValueType: R.Type, forKey key: K, container: KeyedDecodingContainer<K>, resolver: (R) throws -> T) throws -> T {
		let value = try container.decode(R.self, forKey: key)
		return try resolver(value)
	}

	public func decode<T, R: Decodable, K>(_ type: Array<T>.Type, rawValueType: R.Type, forKey key: K, container: KeyedDecodingContainer<K>, resolver: (R) throws -> T) throws -> [T] {
		var accumulator: [T] = []
		var unkeyedContainer = try container.nestedUnkeyedContainer(forKey: key)
		while !unkeyedContainer.isAtEnd {
			let rawValue = try unkeyedContainer.decode(R.self)
			let value = try resolver(rawValue)
			accumulator.append(value)
		}
		return accumulator
	}

	public func decode<T, R: Decodable, K>(_ type: Optional<T>.Type, rawValueType: R.Type, forKey key: K, container: inout KeyedDecodingContainer<K>, resolver: (R) throws -> T) throws -> Optional<T> {
		guard let value = try container.decodeIfPresent(R.self, forKey: key) else {
			return nil
		}
		return try resolver(value)
	}

	public func encode<T, R: Encodable, K>(_ value: T, rawValueType: R, forKey key: K, container: inout KeyedEncodingContainer<K>, resolver: (T) throws -> R) throws {
		let rawValue = try resolver(value)
		try container.encode(rawValue, forKey: key)
	}

	public func encode<T, R: Encodable, K>(_ value: Array<T>, rawValueType: R.Type, forKey key: K, container: inout KeyedEncodingContainer<K>, resolver: (T) throws -> R) throws {
		var unkeyedContainer = container.nestedUnkeyedContainer(forKey: key)
		let rawValue = try value.map { try resolver($0) }
		try unkeyedContainer.encode(contentsOf: rawValue)
	}

	public func encode<T, R: Encodable, K>(_ value: Optional<T>, rawValueType: R.Type, forKey key: K, container: inout KeyedEncodingContainer<K>, resolver: (T) throws -> R) throws {
		guard let value = value else {
			try container.encodeNil(forKey: key)
			return
		}
		let rawValue = try resolver(value)
		try container.encode(rawValue, forKey: key)
	}
}

public enum GraphSelections {
	public struct Operation {
		public let type: OperationType
		public let selectionSet: [Selection]

		public init(type: OperationType, selectionSet: [Selection]) {
			self.type = type
			self.selectionSet = selectionSet
		}
	}

	public enum OperationType {
		case mutation(String)
		case query(String)
		public var name: String {
			switch self {
			case .mutation(let name), .query(let name):
				return name
			}
		}
	}

	public enum Selection {
		case field(Field)
		case fragmentSpread(FragmentSpread, conditionalDirective: ConditionalDirective?)
		case inlineFragment(InlineFragment)

		public static func fragmentSpread(_ fragmentSpread: FragmentSpread) -> Selection {
			return .fragmentSpread(fragmentSpread, conditionalDirective: nil)
		}
	}

	public struct Field {
		public let name: String
		public let alias: String?
		public let conditionalDirective: ConditionalDirective?
		public let arguments: [Argument]
		public let parentType: TypeCondition
		public let type: TypeCondition
		public let selectionSet: [Selection]

		public init(name: String, alias: String?, conditionalDirective: ConditionalDirective? = nil, arguments: [Argument], parentType: TypeCondition, type: TypeCondition, selectionSet: [Selection]) {
			self.name = name
			self.alias = alias
			self.conditionalDirective = conditionalDirective
			self.arguments = arguments
			self.parentType = parentType
			self.type = type
			self.selectionSet = selectionSet
		}
	}

	public enum ConditionalDirective {
		case skip(ArgumentValue)
		case include(ArgumentValue)
	}

	public struct Argument {
		public let name: String
		public let value: ArgumentValue

		public init(name: String, value: ArgumentValue) {
			self.name = name
			self.value = value
		}
	}

	public struct FragmentSpread {
		public let name: String
		public let typeCondition: TypeCondition
		public let selectionSet: [Selection]

		public init(name: String, typeCondition: TypeCondition, selectionSet: [Selection]) {
			self.name = name
			self.typeCondition = typeCondition
			self.selectionSet = selectionSet
		}
	}

	public struct InlineFragment {
		public let typeCondition: TypeCondition
		public let conditionalDirective: ConditionalDirective?
		public let selectionSet: [Selection]

		public init(typeCondition: TypeCondition, conditionalDirective: ConditionalDirective? = nil, selectionSet: [Selection]) {
			self.typeCondition = typeCondition
			self.conditionalDirective = conditionalDirective
			self.selectionSet = selectionSet
		}
	}

	public enum TypeCondition {
		case object(String)
		case interface(String)
		case union(String)
		case scalar(String)
	}

	public enum ArgumentValue {
		case variable(String)
		case intValue(Int)
		case floatValue(Float)
		case stringValue(String)
		case booleanValue(Bool)
		case nullValue
		case enumValue(String)
		case listValue([ArgumentValue])
		case objectValue([ObjectField])
	}

	public struct ObjectField {
		public let name: String
		public let value: ArgumentValue

		public init(name: String, value: ArgumentValue) {
			self.name = name
			self.value = value
		}
	}
}

/// Represents the type of a GraphQL `ID` field. The ID uniquely identifies a GraphQL object and can be used to retrieve that object in a query.
public struct GraphID: RawRepresentable, Equatable, CustomStringConvertible, ExpressibleByStringLiteral {
	/// The string representation of the ID. This is not intended to be human-readable, and you should not rely on its structure.
	public let rawValue: String
	public init(rawValue: String) {
		self.rawValue = rawValue
	}
	public init?(rawValue: String?) {
		guard let rawValue = rawValue else { return nil }
		self.rawValue = rawValue
	}
	public init(stringLiteral value: String) {
		self.rawValue = value
	}
	public var description: String {
		return self.rawValue
	}
}

extension GraphID: Codable {
	public init(from decoder: Decoder) throws {
		let value = try decoder.singleValueContainer().decode(String.self)
		self.init(rawValue: value)
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

/// Represents the type of a nullable field in a GraphQL mutation input.
public enum Input<T> {
	/// Gives the input field a specific value, which may be `nil`.
	/// Fields that have a `.value` will be included in the mutation.
	case value(T?)

	/// Marks the input field as not having a specific value.
	/// Fields that are `.undefined` will not be included in the mutation.
	case undefined

	/// Converts the specified value into a `.value` if it is non-`nil`, or into `.undefined` if it is `nil`.
	///
	/// Example:
	/// ```
	/// let input1 = Input(orUndefined: "Hello world")  // .value("Hello world")
	/// let input2 = Input(orUndefined: nil as String?) // .undefined
	/// ```
	///
	/// - Parameter optional: The value to convert into an `Input`.
	public init(orUndefined optional: Optional<T>) {
		if let value = optional {
			self = .value(value)
		} else {
			self = .undefined
		}
	}
}

public extension Input {
	/// Returns the field's value, if it has one.
	/// Returns `nil` if the field's value is `.undefined` or is explicitly `nil`.
	var optionalValue: T? {
		switch self {
		case .value(let value):
			return value
		case .undefined:
			return nil
		}
	}
}

extension Input: Equatable where T: Equatable {
	public static func == (lhs: Input<T>, rhs: Input<T>) -> Bool {
		switch (lhs, rhs) {
		case (.value(let lhs), .value(let rhs)):
			return lhs == rhs
		case (.undefined, .undefined):
			return true
		default:
			return false
		}
	}
}

extension Input: Encodable where T: Encodable {
	public func encode(to encoder: Encoder) throws {
		switch self {
		case .value(let optionalValue):
			if let value = optionalValue {
				try value.encode(to: encoder)
			} else {
				var container = encoder.singleValueContainer()
				try container.encodeNil()
			}
		case .undefined:
			return
		}
	}
}

private struct DefaultLogger: GraphApiLogger {
	func logError(_ message: StaticString, fileName file: StaticString, functionName function: StaticString, lineNumber line: Int, _ args: CVarArg...) {
#if !os(Linux)
		let formattedMessage = String(format: message.description, args)
		if #available(iOSApplicationExtension 10.0, *) {
			os_log(message, log: OSLog.default, type: .error, args)
		} else {
			print(formattedMessage)
		}
#endif
	}
}

private extension GraphApiQuery {
	static var logger: GraphApiLogger {
		return Self.errorLogger ?? Self.defaultLogger
	}
	static var defaultLogger: GraphApiLogger {
		return DefaultLogger()
	}
}

private extension GraphApiResponse {
	static var logger: GraphApiLogger {
		return Self.errorLogger ?? Self.defaultLogger
	}
	static var defaultLogger: GraphApiLogger {
		return DefaultLogger()
	}

	private func collapseFragments(from fields: [String: Any]) -> [String: Any] {
		var result: [String: Any] = [:]
		for (key, value) in fields {
			switch value {
			case let value as [String: Any]:
				let collapsedValue = collapseFragments(from: value)
				if key.hasPrefix("fragment:") {
					result.merge(collapsedValue, uniquingKeysWith: self.mergeDuplicateDictionaryKey)
				} else if var existingValue = result[key] as? [String: Any] {
					existingValue.merge(collapsedValue, uniquingKeysWith: self.mergeDuplicateDictionaryKey)
					result[key] = existingValue
				} else {
					result[key] = collapsedValue
				}
			case let values as [[String: Any]]:
				let collapsedValues = values.map { collapseFragments(from: $0) }
				if let existingValues = result[key] as? [[String: Any]] {
					let merged: [[String: Any]] = zip(existingValues, collapsedValues).map {
						let merged = $0.0.merging($0.1, uniquingKeysWith: self.mergeDuplicateDictionaryKey)
						return merged
					}
					result[key] = merged
				} else {
					result[key] = collapsedValues
				}
				break
			default:
				result[key] = value
			}
		}
		return result
	}

	private func mergeDuplicateDictionaryKey(_ value1: Any, _ value2: Any) -> Any {
		switch (value1, value2) {
		case (let value1Dict as [String: Any], let value2Dict as [String: Any]):
			return value1Dict.merging(value2Dict, uniquingKeysWith: self.mergeDuplicateDictionaryKey)
		case (let value1Dicts as [[String: Any]], let value2Dicts as [[String: Any]]):
			let merged: [[String: Any]] = zip(value1Dicts, value2Dicts).map {
				return $0.0.merging($0.1, uniquingKeysWith: self.mergeDuplicateDictionaryKey)
			}
			return merged
		default:
			return value1
		}
	}
}

#if compiler(<5.1)
/// A class of types whose instances hold the value of an entity with stable identity.
/// See https://github.com/apple/swift/blob/master/stdlib/public/core/Identifiable.swift
/// for more details.
public protocol Identifiable {

	/// A type representing the stable identity of the entity associated with `self`.
	associatedtype ID: Hashable

	/// The stable identity of the entity associated with `self`.
	var id: ID { get }
}

extension Identifiable where Self: AnyObject {
	public var id: ObjectIdentifier {
		return ObjectIdentifier(self)
	}
}
#endif
