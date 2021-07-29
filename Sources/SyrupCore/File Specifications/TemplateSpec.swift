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
import Yams

public struct TemplateSpec {
	struct Specification: Codable {
		enum Language: String, Codable {
			case swift
			case kotlin
			case typescript
		}
		var language: Language
		var `extension`: String
		var nullString: String
		var reservedWords: [String]
		var builtInScalars: BuiltInScalars
	}
	let location: String
	let specification: Specification
	
	public init(location: String) throws {
		self.location = location
		let url = URL(fileURLWithPath: location).appendingPathComponent("Template.yml")
		self.specification = try YAMLDecoder().decode(Specification.self, from: url, userInfo: [:])
	}
	
	public struct BuiltInScalars: Codable {
		public enum GraphQLScalar: String, CodingKey {
			case int = "Int"
			case float = "Float"
			case string = "String"
			case boolean = "Boolean"
			case id = "ID"
		}
		
		public let scalars: [String: String]

		public subscript(scalar: GraphQLScalar) -> ScalarType {
			let nativeType = scalars[scalar.rawValue]!
			return Scalar(nativeType: nativeType, graphType: scalar.rawValue)
		}
		
		public subscript(rawValue: String) -> ScalarType? {
			guard let graphQLScalar = GraphQLScalar(rawValue: rawValue) else {
				return nil
			}
			return self[graphQLScalar]
		}
		
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: GraphQLScalar.self)
			let keys: [GraphQLScalar] = [.int, .float, .string, .boolean, .id]
			let nativeTypes = try keys.map { key throws -> String in
				do {
					return try container.decode(String.self, forKey: key)
				} catch DecodingError.valueNotFound {
					fatalError("Could not find value for native type \(key). Specify these in your Template.yml file.")
				} catch DecodingError.keyNotFound {
					fatalError("Could not find entry for native type \(key). Specify these in your Template.yml file.")
				} catch let error {
					throw error
				}
			}
			var scalars: [String: String] = [:]
			for (key, nativeType) in zip(keys, nativeTypes) {
				scalars[key.rawValue] = nativeType
			}
			self.scalars = scalars
		}
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: GraphQLScalar.self)
			try container.encode(self[.int].nativeType, forKey: .int)
			try container.encode(self[.float].nativeType, forKey: .float)
			try container.encode(self[.string].nativeType, forKey: .string)
			try container.encode(self[.boolean].nativeType, forKey: .boolean)
			try container.encode(self[.id].nativeType, forKey: .id)
		}
		
		private struct Scalar: ScalarType {
			let nativeType: String
			let graphType: String
		}
	}
}
