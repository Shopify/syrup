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

public struct ProjectSpec: Codable {
	var moduleName: String
	var filenameSuffix: String?
	var header: String?
	var supportFilesHeader: String?
	var accessLevel: String
	var generateSelections: Bool
	
	private static let defaultAccessLevel = "public"
	
	enum CodingKeys: CodingKey {
		case moduleName
		case filenameSuffix
		case header
		case supportFilesHeader
		case accessLevelOverride
		case generateSelections
	}
	
	public init(moduleName: String, filenameSuffix: String? = nil, header: String? = nil, supportFilesHeader: String? = nil, accessLevel: String = "", generateSelections: Bool = true) {
		self.moduleName = moduleName
		self.filenameSuffix = filenameSuffix
		self.header = header
		self.supportFilesHeader = supportFilesHeader
		self.accessLevel = accessLevel
		self.generateSelections = generateSelections
	}
	
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.moduleName = try container.decode(String.self, forKey: .moduleName)
		self.filenameSuffix = try container.decodeIfPresent(String.self, forKey: .filenameSuffix)
		self.header = try container.decodeIfPresent(String.self, forKey: .header)
		self.accessLevel = try container.decodeIfPresent(String.self, forKey: .accessLevelOverride) ?? ProjectSpec.defaultAccessLevel
		self.generateSelections = try container.decodeIfPresent(Bool.self, forKey: .generateSelections) ?? false
		self.supportFilesHeader = try container.decodeIfPresent(String.self, forKey: .supportFilesHeader) ?? self.header
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(moduleName, forKey: .moduleName)
		try container.encodeIfPresent(filenameSuffix, forKey: .filenameSuffix)
		try container.encodeIfPresent(header, forKey: .header)
		try container.encodeIfPresent(supportFilesHeader, forKey: .supportFilesHeader)
		try container.encodeIfPresent(accessLevel, forKey: .accessLevelOverride)
		try container.encodeIfPresent(generateSelections, forKey: .generateSelections)
	}
}
