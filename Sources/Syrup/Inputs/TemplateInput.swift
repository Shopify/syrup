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

struct TemplateInput: ParsableArguments {
	@Argument(help: "Name of the template to use. This will be resolved against the templatePath")
	var templateName: String
	
	@Option(help: "Overrides the default search path for templates.", completion: .directory, transform: Folder.init(path:))
	var templatePath: Folder?
	
	var resolvedTemplateFolder: Folder? {
		var searchPaths = [templatePath]
		
		// In debug mode attempt to add the project templates folder by going from current file upwards to the Package.swift file and attempting to use that as a reference
		#if DEBUG
		if let folder = Folder.swiftPackage, let templateFolder = try? folder.subfolder(named: "Templates") {
			searchPaths.append(templateFolder)
		}
		#endif
		
		// If using mint then templates sit next to the command line application
		if ProcessInfo.processInfo.environment["MINT"] == "YES",
			let command = CommandLine.arguments.first,
			let commandFolder = try? File(path: command).parent,
			let templateFolder = try? commandFolder.subfolder(named: "Templates") {
			searchPaths.append(templateFolder)
		}
		
		return searchPaths.compactMap {
			try? $0?.subfolder(named: templateName)
		}.first
	}
	
	func validate() throws {
		guard let resolvedTemplateFolder = resolvedTemplateFolder else {
			throw ValidationError("No template found in search path(s)")
		}
		guard resolvedTemplateFolder.containsFile(named: "Template.yml") else {
			throw ValidationError("No valid Template.yml file found: \(resolvedTemplateFolder.path)")
		}
	}
}
