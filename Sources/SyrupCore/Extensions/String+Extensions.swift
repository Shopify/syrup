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
import Crypto

extension String {
	func indented(indentStr: String = "\t") -> String {
		self.split(separator: "\n")
			.map({ indentStr + $0 + "\n" })
			.joined()
	}
	
	var capitalizedFirstLetter: String {
		self.prefix(1).uppercased() + self.suffix(self.count - 1)
	}
	
	var lowercasedFirstLetter: String {
		self.prefix(1).lowercased() + self.suffix(self.count - 1)
	}
	
	var removingExcessNewlines: String {
		let pattern = "[\\s]*[\\n]([\\s]*[\\n])+"
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let replaced = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.count), withTemplate: "\n\n")
		return replaced
	}
	
	var removingLeadingSpaces: String {
		let pattern = "[\\s]+"
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		let replaced = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.count), withTemplate: " ")
		return replaced
	}
	
	var removingNewLines: String {
		self.replacingOccurrences(of: "\n", with: " ")
	}
	
	func convertToPascalCase() -> String {
		return self.split { char in
			char.isPunctuation
		}.map { splitStr in
			splitStr.capitalized
		}.joined()
	}
	
	func removeSuffix(_ suffix: String) -> String {
		guard self.hasSuffix(suffix) else { return self }
		return String(self.dropLast(suffix.count))
	}
	
	func sha256Stringified() -> String {
		if let value = self.data(using: String.Encoding.utf8) {
			return SHA256.hash(data: value).hexStr
		}
		
		return ""
	}
}
