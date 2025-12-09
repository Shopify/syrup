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

public enum CommentRendering: String, Codable {
	/// Include all comments from the GraphQL schema (default)
	case comments = "comments"
	/// Don't include any comments
	case noComments = "no-comments"
	/// Only include comments that contain @deprecated warnings
	case onlyDeprecations = "only-deprecations"
}

public struct ProjectSpec: Codable {
	public var moduleName: String
	public var filenameSuffix: String?
	public var header: String?
	public var supportFilesHeader: String?
	public var accessLevel: String
	public var generateSelections: Bool
	public var commentRendering: CommentRendering

	private static let defaultAccessLevel = "public"
	private static let defaultCommentRendering = CommentRendering.comments

	enum CodingKeys: CodingKey {
		case moduleName
		case filenameSuffix
		case header
		case supportFilesHeader
		case accessLevelOverride
		case generateSelections
		case commentRendering
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.moduleName = try container.decode(String.self, forKey: .moduleName)
		self.filenameSuffix = try container.decodeIfPresent(String.self, forKey: .filenameSuffix)
		self.header = try container.decodeIfPresent(String.self, forKey: .header)
		self.accessLevel = try container.decodeIfPresent(String.self, forKey: .accessLevelOverride) ?? ProjectSpec.defaultAccessLevel
		self.generateSelections = try container.decodeIfPresent(Bool.self, forKey: .generateSelections) ?? false
		self.supportFilesHeader = try container.decodeIfPresent(String.self, forKey: .supportFilesHeader) ?? self.header
		self.commentRendering = try container.decodeIfPresent(CommentRendering.self, forKey: .commentRendering) ?? ProjectSpec.defaultCommentRendering
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(moduleName, forKey: .moduleName)
		try container.encodeIfPresent(filenameSuffix, forKey: .filenameSuffix)
		try container.encodeIfPresent(header, forKey: .header)
		try container.encodeIfPresent(supportFilesHeader, forKey: .supportFilesHeader)
		try container.encodeIfPresent(accessLevel, forKey: .accessLevelOverride)
		try container.encodeIfPresent(generateSelections, forKey: .generateSelections)
		try container.encodeIfPresent(commentRendering, forKey: .commentRendering)
	}
}
