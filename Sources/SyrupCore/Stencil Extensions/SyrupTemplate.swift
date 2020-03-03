/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2017 SwiftGen
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
import Stencil

#if os(Linux) && !swift(>=3.1)
typealias NSRegularExpression = RegularExpression
#endif

// Workaround until Stencil fixes https://github.com/kylef/Stencil/issues/22
open class SyrupTemplate: Stencil.Template {
	public required init(templateString: String, environment: Environment? = nil, name: String? = nil) {
		let templateStringWithMarkedNewlines = templateString
			.replacingOccurrences(of: "\n\n", with: "\n\u{000b}\n")
			.replacingOccurrences(of: "\n\n", with: "\n\u{000b}\n")
		super.init(templateString: templateStringWithMarkedNewlines, environment: environment, name: name)
	}
	
	open override func render(_ dictionary: [String: Any]? = nil) throws -> String {
		return try removeExtraLines(from: super.render(dictionary))
	}
	
	// Workaround until Stencil fixes https://github.com/kylef/Stencil/issues/22
	private func removeExtraLines(from str: String) -> String {
		let extraLinesRE: NSRegularExpression = {
			do {
				return try NSRegularExpression(pattern: "\\n([ \\t]*\\n)+", options: [])
			} catch {
				fatalError("Regular Expression pattern error: \(error)")
			}
		}()
		let compact = extraLinesRE.stringByReplacingMatches(
			in: str,
			options: [],
			range: NSRange(location: 0, length: str.utf16.count),
			withTemplate: "\n"
		)
		let unmarkedNewlines = compact
			.replacingOccurrences(of: "\n\u{000b}\n", with: "\n\n")
			.replacingOccurrences(of: "\n\u{000b}\n", with: "\n\n")
		return unmarkedNewlines
	}
}
