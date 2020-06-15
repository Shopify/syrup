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
import SyrupCore

struct Generate: ParsableCommand {
	static var configuration = CommandConfiguration(abstract: "Generates GraphQL models and relevant support files.", discussion: "")
	
	@OptionGroup()
	var input: Input
	
	func run() throws {
		let project = try YAMLDecoder().decode(ProjectSpec.self, from: input.project.file.url, userInfo: [:])
		let scalars: ScalarSpec
		if let scalarsFile = input.scalars {
			scalars = try YAMLDecoder().decode(ScalarSpec.self, from: scalarsFile.url, userInfo: [:])
		} else {
			scalars = ScalarSpec()
		}
		
		let template = try TemplateSpec(location: input.resolvedTemplateFolder!.path)
		
		let config = SyrupCore.Config(
			schema: input.schema,
			shouldGenerateModels: input.generateModels,
			shouldGenerateSupportFiles: input.generateSupport,
			queries: try input.queries.resolve().path,
			destination: try input.destination.resolve().path,
			supportFilesDestination: try input.supportFilesDestination.resolve().path,
			template: template,
			project: project,
			scalars: scalars,
			verbose: input.verbose
		)
		
		if input.generateModels || input.generateSupport {
			let generator = Generator(config: config)
			try generator.generate()
		}
	}
}

struct Input: ParsableArguments {
	
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
	
	@Argument(help: "Name of the template to use. This will be resolved against the templatePath")
	var templateName: String
	
	@Option<File?>(help: "YAML configuration file that describes type mapping of GraphQL scalar to native types.", transform: File.init(path:))
	var scalars: File?
	 
	@Option<SyrupFile>(default: SyrupFile(), help: "YAML project configuration file.", transform: SyrupFile.init(path:))
	var project: SyrupFile
	
	@Option(help: "Overrides the default search path for templates.", transform: Folder.init(path:))
	var templatePath: Folder?
	
	@Flag<Bool>(default: true, inversion: .prefixedEnableDisable, help: "")
	var generateModels: Bool
	
	@Option<LazyFolder>(
		default: LazyFolder(root: Folder.current, name: "GraphQL"),
		help: "This provides the path to the folder containing all of your graphql operation definitions. These files are expected to have the .graphql suffix and should be valid graphql operations.",
		transform: LazyFolder.init(string:)
	)
	var queries: LazyFolder
	
	@Option<LazyFolder>(
		default: LazyFolder(root: Folder.current, name: "Models"),
		help: "This provides the path to the folder where the generated code should be written to.",
		transform: LazyFolder.init(string:)
	)
	var destination: LazyFolder
	
	@Option<LazyFolder>(
		default: LazyFolder(root: Folder.current, name: "Support"),
		help: "This provides the path to the folder where the necessary support files should be written to.",
		transform: LazyFolder.init(string:)
	)
	var supportFilesDestination: LazyFolder
	
	@Flag<Bool>(default: true, inversion: .prefixedEnableDisable, help: "")
	var generateSupport: Bool
	
	@Option<URL>(help: "Location of the GraphQL schema. Can either be a HTTPS URL or a path to a file on disk.", transform: { try $0.toURL() })
	var schema: URL
	
	@Flag(help: "Verbose output, reports on duplicates, etc.")
	var verbose: Bool
	
	func validate() throws {
		guard let resolvedTemplateFolder = resolvedTemplateFolder else {
			throw ValidationError("No template found in search path(s)")
		}
		guard resolvedTemplateFolder.containsFile(named: "Template.yml") else {
			throw ValidationError("No valid Template.yml file found: \(resolvedTemplateFolder.path)")
		}
	}
	
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
}
