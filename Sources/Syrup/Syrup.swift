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

import ArgumentParser
import Foundation
import SyrupCore
import TSCUtility
import Yams

@main
struct Syrup: ParsableCommand {
	static var configuration: CommandConfiguration = .init(
		abstract: "A utility for generating GraphQL Types",
		version: "\(TSCUtility.Version(0, 9, 28))",
		subcommands: [
			Generate.self,
			GenerateModels.self,
			GenerateSupportFiles.self,
			Report.self,
		]
	)
}

struct GenerationOptions: ParsableArguments {
	@Argument(
		help: "The directory path syrup uses to generate your GraphQL files.",
		completion: .directory
	)
	var template: String
	
	@Option(
		help: "YAML project configuration file",
		completion: .file(extensions: ["yaml", "yml"])
	)
	var project: String
	
	@Option(
		help: "YAML schema configuration file",
		completion: .file(extensions: ["yaml", "yml"])
	)
	var schema: String
	
	@Option(
		help: "The URL or filesystem path which overrides the project's schema location"
	)
	var overrideSchema: String
}

extension Syrup {
	struct Generate: ParsableCommand {
		static var configuration: CommandConfiguration = .init(
			abstract: "Generates all models and support files."
		)
		
		@Argument(
			help: """
			The directory path containing all of your GraphQL operation definitions.
			These files must have a file extension matching graphql.
			They must also be valid graphql operations.
			""",
			completion: .directory
		)
		var queries: String
		
		@Argument(
			help: "The directory path syrup puts generated code in.",
			completion: .directory
		)
		var destination: String
		
		@Argument(
			help: "The directory path syrup puts support files in.",
			completion: .directory
		)
		var supportFiles: String
		
		@OptionGroup
		var options: GenerationOptions
		
		@Option(
			help: "The file path syrup uses puts the deprecation report ing.",
			completion: .file()
		)
		var reports: String
		
		func run() throws {
			let projectUrl = URL(fileURLWithPath: options.project)
			let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
			let schemaUrl = URL(fileURLWithPath: options.schema)
			
			var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
			schema.location = options.overrideSchema
			
			let template = try TemplateSpec(location: options.template)
			let config = SyrupCore.Config(
				shouldGenerateModels: true,
				shouldGenerateSupportFiles: true,
				queries: queries,
				destination: destination,
				supportFilesDestination: supportFiles,
				template: template,
				project: project,
				schema: schema,
				verbose: false,
				outputReportFilePath: .init(reports),
				shouldOverwriteReport: false
			)
			
			try Generator(config: config).generate()
		}
	}
}

extension Syrup {
	struct GenerateModels: ParsableCommand {
		static var configuration: CommandConfiguration = .init(
			abstract: "Runs the generator and only outputs generated models"
		)
		
		@Argument(
			help: """
			The directory path containing all of your GraphQL operation definitions.
			These files must have a file extension matching graphql.
			They must also be valid graphql operations.
			""",
			completion: .directory
		)
		var queries: String

		@Argument(
			help: "The directory path syrup puts generated code in.",
			completion: .directory
		)
		var destination: String
		
		@OptionGroup
		var options: GenerationOptions
		
		@Option(
			help: "The file path syrup uses puts the deprecation report ing.",
			completion: .file()
		)
		var reports: String

		func run() throws {
			let projectUrl = URL(fileURLWithPath: options.project)
			let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
			let schemaUrl = URL(fileURLWithPath: options.schema)
			
			var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
			schema.location = options.overrideSchema
			
			let template = try TemplateSpec(location: options.template)
			let config = SyrupCore.Config(
				shouldGenerateModels: true,
				shouldGenerateSupportFiles: true,
				queries: queries,
				destination: destination,
				supportFilesDestination: "",
				template: template,
				project: project,
				schema: schema,
				verbose: false,
				outputReportFilePath: .init(reports),
				shouldOverwriteReport: false
			)
			
			try Generator(config: config).generate()
		}
	}
}

extension Syrup {
	struct GenerateSupportFiles: ParsableCommand {
		static var configuration: CommandConfiguration = .init(
			abstract: "Runs the generator and only outputs generated support files."
		)
		
		@Argument(
			help: "The directory path syrup puts support files in.",
			completion: .directory
		)
		var supportFiles: String

		@OptionGroup
		var options: GenerationOptions
		
		func run() throws {
			let projectUrl = URL(fileURLWithPath: options.project)
			let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
			let schemaUrl = URL(fileURLWithPath: options.schema)
			
			var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
			schema.location = options.overrideSchema
			
			let template = try TemplateSpec(location: options.template)
			let config = SyrupCore.Config(
				shouldGenerateModels: true,
				shouldGenerateSupportFiles: true,
				queries: "",
				destination: "",
				supportFilesDestination: supportFiles,
				template: template,
				project: project,
				schema: schema,
				verbose: false,
				outputReportFilePath: nil,
				shouldOverwriteReport: false
			)
			
			try Generator(config: config).generate()
		}
	}
}

extension Syrup {
	struct Report: ParsableCommand {
		static var configuration: CommandConfiguration = .init(
			abstract: "Runs and generates deprecation report only; no files are generated."
		)
		
		@Argument(
			help: """
			The directory path containing all of your GraphQL operation definitions.
			These files must have a file extension matching graphql.
			They must also be valid graphql operations.
			""",
			completion: .directory
		)
		var queries: String

		@OptionGroup
		var options: GenerationOptions
		
		@Option(
			help: "The file path syrup uses puts the deprecation report ing.",
			completion: .file()
		)
		var reports: String

		@Flag(
			name: [.short, .long],
			help: "Overwrite the existing report."
		)
		var overwrite = false
		
		@Flag(
			name: [.short, .long],
			help: "Verbose output, reports on duplicates, etc."
		)
		var verbose = false
		
		func run() throws {
			let projectUrl = URL(fileURLWithPath: options.project)
			let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
			let schemaUrl = URL(fileURLWithPath: options.schema)
			
			var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
			schema.location = options.overrideSchema
			
			let template = try TemplateSpec(location: options.template)
			let config = SyrupCore.Config(
				shouldGenerateModels: true,
				shouldGenerateSupportFiles: true,
				queries: queries,
				destination: "",
				supportFilesDestination: "",
				template: template,
				project: project,
				schema: schema,
				verbose: false,
				outputReportFilePath: .init(reports),
				shouldOverwriteReport: false
			)
			
			try Reporter(config: config).generateReport()
		}
	}
}
