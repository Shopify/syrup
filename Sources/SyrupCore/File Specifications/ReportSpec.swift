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

public enum DeprecationType: String, Codable, CaseIterable {
	case Operation, Fragment
}

struct Deprecation: Codable {
	let type: DeprecationType
	let key: String
	let value: Date
}

public struct ReportSpec: Codable {

	enum CodingKeys: CodingKey {
		case deprecations
	}

	// NOTE: Deprecations however are 'carried over' and read/written.
	var deprecations = [Deprecation]()

	private static let defaultAccessLevel = "public"

	public init(deprecations: [DeprecationType: [String: Date]] = [DeprecationType: [String: Date]]()) {
		DeprecationType.allCases.forEach { type in
			deprecations[type]?
					.sorted { $0.key < $1.key }
					.forEach { tuple in
						self.deprecations.append(
							Deprecation(type: type, key: tuple.key, value: tuple.value)
						)
					}
		}
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.deprecations = try container.decode([Deprecation].self, forKey: .deprecations)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(deprecations, forKey: .deprecations)
	}

	public func toDictionary() throws -> [DeprecationType: [String: Date]] {
		return self.deprecations.reduce(into: [DeprecationType: [String: Date]]()) { result, deprecation in
			if var parent = result[deprecation.type] {
				parent[deprecation.key] = deprecation.value
				result[deprecation.type] = parent
			} else {
				result[deprecation.type] = [deprecation.key: deprecation.value]
			}
		}
	}
}
