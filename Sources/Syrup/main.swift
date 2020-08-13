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

var additionalArgs: [String] = []
#if DEBUG
if let folder = Folder.swiftPackage,
	let testArgs = try? folder.file(named: "Test.commands").readAsString() {
	var lines = testArgs.components(separatedBy: .newlines).filter { !$0.starts(with: "#") }
	if let firstLine = lines.first {
		if let folder = try? Folder(path: firstLine) {
			FileManager.default.changeCurrentDirectoryPath(folder.path)
			lines.removeFirst()
		}
		lines.forEach {
			additionalArgs.append(contentsOf: $0.components(separatedBy: .whitespaces).filter { !$0.isEmpty })
		}
	}
}
#endif
Syrup.main(CommandLine.arguments.dropFirst() + additionalArgs)
