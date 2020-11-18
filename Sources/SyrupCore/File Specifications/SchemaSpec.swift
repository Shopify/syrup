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

public struct SchemaSpec: Codable {
	private struct CustomScalar: Codable {
		let graphType: String
		let nativeType: String
		let rawValueType: String?
		
		public init(graphType: String, nativeType: String, rawValueType: String? = nil) {
			self.graphType = graphType
			self.nativeType = nativeType
			self.rawValueType = rawValueType
		}
		
		var scalarIR: ScalarType {
			if let rawValueType = rawValueType {
				return IntermediateRepresentation.CustomCodedScalar(graphType: graphType, nativeType: nativeType, rawValueType: rawValueType)
			} else {
				return IntermediateRepresentation.CustomScalar(graphType: graphType, nativeType: nativeType)
			}
		}
		
		static func scalars(_ scalars: [ScalarType]) -> [CustomScalar] {
			scalars.map {
				if let customCodedScalar = $0 as? IntermediateRepresentation.CustomCodedScalar {
					return CustomScalar(graphType: $0.graphType, nativeType: $0.nativeType, rawValueType: customCodedScalar.rawValueType)
				} else {
					return CustomScalar(graphType: $0.graphType, nativeType: $0.nativeType)
				}
			}
		}
	}
	
	enum CodingKeys: String, CodingKey {
		case location
		case customScalars
	}
	public var location: String
	var customScalars: [ScalarType]
	
	public init(location: String, customScalars: [ScalarType]) {
		self.location = location
		self.customScalars = customScalars
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.location = try container.decode(String.self, forKey: .location)
		let customScalars = try container.decode([CustomScalar].self, forKey: .customScalars)
		self.customScalars = customScalars.map {
			$0.scalarIR
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(location, forKey: .location)
		try container.encode(CustomScalar.scalars(customScalars), forKey: .customScalars)
	}
}
