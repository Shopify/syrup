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

/// Provides a means to have either a folder that is provided, or, when not provided, a default one is created.
struct LazyFolder: CustomStringConvertible {
	private enum Value {
		case lazy(root: Folder, name: String)
		case provided(Folder)
	}
	private let value: Value
	
	init(root: Folder, name: String) {
		self.value = .lazy(root: root, name: name)
	}
	
	init(folder: Folder) {
		self.value = .provided(folder)
	}
	
	init(string: String) throws {
		let folder = try Folder(path: string)
		self.init(folder: folder)
	}
	
	func resolve() throws -> Folder {
		switch value {
		case .lazy(let root, let name):
			return try root.createSubfolderIfNeeded(withName: name)
		case .provided(let value):
			return value
		}
	}
	
	var description: String {
		switch value {
		case .lazy(let root, let name):
			return root.url.appendingPathComponent(name, isDirectory: true).path
		case .provided(let value):
			return "\(value)"
		}
	}
}
