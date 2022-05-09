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
import Files

enum FileParser {
	enum FileParserError: LocalizedError {
		case duplicateFile(String)
		case invalidPathExtension(path: String)
		case invalidEncoding(path: String)
		
		var errorDescription: String? {
			switch self {
			case .duplicateFile(let name):
				return "Found duplicate file named \(name)"
			case let .invalidPathExtension(path):
				return #"Invalid path extension given (\#(path)).  All path extensions must end in "graphql""#
			case let .invalidEncoding(path):
				return "Invalid file encoding for \(path).  Files must use UTF-8 encoding"
			}
		}
	}
	
	static func parseFiles(
		at paths: [String]
	) throws -> [String: String] {
		try paths.reduce(into: [:]) { accumulator, path in
			let file = try File(path: path)
			
			guard file.extension == "graphql" else {
				throw FileParserError.invalidPathExtension(path: path)
			}
			
			guard let string = String(data: try file.read(), encoding: .utf8) else {
				throw FileParserError.invalidEncoding(path: path)
			}
			
			guard !accumulator.keys.contains(file.name) else {
				throw FileParserError.duplicateFile(file.name)
			}
			
			accumulator[file.name] = string
		}
	}
	
	static func parseFiles(at location: String) throws -> [String: String] {
		let folder = try Folder(path: location)
		var results: [String: String] = [:]
		try parseFiles(from: folder, intoResult: &results)
		return results
	}
	
	private static func parseFiles(from folder: Folder, intoResult result: inout [String: String]) throws {
		for file in folder.files {
			guard file.extension == "graphql" else { continue }
			let data = try file.read()
			let string = String(data: data, encoding: .utf8)!
			guard result[file.name] == nil else {
				throw FileParserError.duplicateFile(file.name)
			}
			result[file.name] = string
		}
		for subfolder in folder.subfolders {
			try parseFiles(from: subfolder, intoResult: &result)
		}
	}
}
