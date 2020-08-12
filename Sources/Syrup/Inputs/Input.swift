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
import ArgumentParser
import Files

struct Input: ParsableArguments {
	/// Provides a custom type to resolve the path to the syrup project configuration file.
	/// Main reason for this to exist is to provide a nicer output for the default value when looking at the commands help output.
	struct SyrupFile: CustomStringConvertible {
		private static var defaultSyrupFile: File? {
			return [".syrup.yml", "syrup.yml"].compactMap {
				try? Folder.current.file(at: $0)
			}.first
		}
		
		let file: File
		
		init?() {
			guard let defaultFile = Self.defaultSyrupFile else { return nil }
			self.file = defaultFile
		}
		
		init(path: String) throws {
			self.file = try File(path: path)
		}
		
		var description: String {
			return file.path
		}
	}
	
	@Option<File?>(help: "YAML configuration file that describes type mapping of GraphQL scalar to native types.", completion: .file(extensions: ["yaml", "yml"]), transform: File.init(path:))
	var scalars: File?
	
	@Option<SyrupFile?>(help: "YAML project configuration file.", completion: .file(extensions: ["yaml", "yml"]), transform: SyrupFile.init(path:))
	var project: SyrupFile?
	
	@Option<LazyFolder>(
		help: "This provides the path to the folder containing all of your graphql operation definitions. These files are expected to have the .graphql suffix and should be valid graphql operations.",
		completion: .directory,
		transform: LazyFolder.init(string:)
	)
	var queries = LazyFolder(root: Folder.current, name: "GraphQL")
	
	@Option<URL>(help: "Location of the GraphQL schema. Can either be a HTTPS URL or a path to a file on disk.", transform: { try $0.toURL() })
	var schema: URL
	
	var workingDirectory: Folder { return Folder.current }
}
