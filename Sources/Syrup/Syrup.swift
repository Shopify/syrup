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

import Basic
import Foundation
import SyrupCore
import Utility
import Yams

class Syrup {
	static let version = Version(0, 9, 28)

	struct Arguments {
		/// The command that was selected.
		var command: Command = .generate
		/// Should the models representing the GraphQL operations be generated
		var shouldGenerateModels: Bool = true
		/// Should the support files based on the GraphQL schema be generated
		var shouldGenerateSupportFiles: Bool = true
		/// Location of the input .graphql files
		var queries: AbsolutePath = localFileSystem.currentWorkingDirectory!.appending(component: "GraphQL")
		/// Location where the generated models will be outputted
		var destination: AbsolutePath = localFileSystem.currentWorkingDirectory!.appending(component: "Models")
		/// Location where the required support files will be outputted
		var supportFilesDestination: AbsolutePath = localFileSystem.currentWorkingDirectory!.appending(component: "Support")
		/// Location of the folder containing the Stencil template files
		var template: AbsolutePath
		/// Location of the YAML file describing the project
		var project: AbsolutePath
		/// Location of the YAML file describing the schema
		var schema: AbsolutePath
		/// Overridden schema location, can be either a path to a file on disk or a remote location via https
		var overridenSchema: String?

		/// Deprecation report output file [.yml]
		var deprecationReport: AbsolutePath?
		var shouldOverwriteReport: Bool = false

		/// If the current version of the tool should be printed
		var shouldPrintVersion: Bool = false

		var verbose: Bool = false

		init(commandDirectory: AbsolutePath = AbsolutePath(CommandLine.arguments[0], relativeTo: localFileSystem.currentWorkingDirectory!).parentDirectory, currentWorkingDirectory: AbsolutePath = localFileSystem.currentWorkingDirectory!) {
			self.template = commandDirectory.appending(component: "Templates")
			let configFileDefaults = [".syrup.yml", "syrup.yml"]
			let projectDefaults = configFileDefaults.lazy.map { currentWorkingDirectory.appending(component: $0) }
			self.project = projectDefaults.first {
				return localFileSystem.isFile($0)
				} ?? projectDefaults[0]
			self.schema = self.project
		}

		static func isValidTemplate(_ template: AbsolutePath) -> Bool {
			guard localFileSystem.isDirectory(template) else { return false }
			guard localFileSystem.exists(template.appending(component: "Template.yml")) else { return false }
			return true
		}
	}

	enum Command: String {
		case generate
		case generateModels = "generate-models"
		case generateSupportFiles = "generate-support-files"
		case report = "report"

		var overview: String {
			switch self {
				case .generate:
					return "Runs the generator. Expected positional arguments in the ordering of <Operations Location> <Models Destination> <Support Files Destination> <Template>\n"
				case .generateModels:
					return "Runs the generator and only outputs generated models. Expected positional arguments in the ordering of <Operations Location> <Models Destination> <Template>\n"
				case .generateSupportFiles:
					return "Runs the generator and only outputs generated support files. Expected positional arguments in the ordering of <Support Files Destination> <Template>\n"
				case .report:
					return "Runs and generates deprecation report only, does not generate any graphql code files. Expected positional arguments in the ordering of <Operations Location> <Template>\n"
			}
		}

		func addAsSubparser(to parser: ArgumentParser) -> ArgumentParser {
			return parser.add(subparser: self.rawValue, overview: self.overview)
		}
	}

	let parser = ArgumentParser(usage: "[command]", overview: "")
	let binder = ArgumentBinder<Arguments>()

	init() {
		binder.bind(option: parser.add(
			option: "--version",
			shortName: "-v",
			kind: Bool.self,
			usage: "Prints the current version")
		) { (options, shouldPrintVersion) in
			options.shouldPrintVersion = shouldPrintVersion
		}

		binder.bind(parser: parser) { (options, subparser) in
			options.command = Command(rawValue: subparser)!
			switch options.command {
			case .generate:
				options.shouldGenerateModels = true
				options.shouldGenerateSupportFiles = true
			case .generateModels:
				options.shouldGenerateModels = true
				options.shouldGenerateSupportFiles = false
			case .generateSupportFiles:
				options.shouldGenerateSupportFiles = true
				options.shouldGenerateModels = false
			case .report:
				options.shouldGenerateSupportFiles = false
				options.shouldGenerateModels = false
			}
		}

		// SUB PARSER CONFIGURATIONS
		// NOTE: Since we use positional arguments, order is important.

		let generateParser = Command.generate.addAsSubparser(to: parser)
		let queriesArg = addQueriesArgument(to: generateParser)
		let destinationArg = addDestinationArgument(to: generateParser)
		let supportFilesArg = addSupportFilesArgument(to: generateParser)
		let templateArg = addTemplateArgument(to: generateParser)
		let projectArg = addProjectArgument(to: generateParser)
		let schemaArg = addSchemaArgument(to: generateParser)
		let schemaOverrideArg = addOverrideSchemaArgument(to: generateParser)
		let deprecationReportArg = addDeprecationReportArgument(to: generateParser)

		let generateModelsParser = Command.generateModels.addAsSubparser(to: parser)
		addQueriesArgument(to: generateModelsParser)
		addDestinationArgument(to: generateModelsParser)
		addTemplateArgument(to: generateModelsParser)
		addProjectArgument(to: generateModelsParser)
		addSchemaArgument(to: generateModelsParser)
		addOverrideSchemaArgument(to: generateModelsParser)
		addDeprecationReportArgument(to: generateModelsParser)

		let generateSupportFilesParser = Command.generateSupportFiles.addAsSubparser(to: parser)
		addSupportFilesArgument(to: generateSupportFilesParser)
		addTemplateArgument(to: generateSupportFilesParser)
		addProjectArgument(to: generateSupportFilesParser)
		addSchemaArgument(to: generateSupportFilesParser)
		addOverrideSchemaArgument(to: generateSupportFilesParser)

		let reportParser = Command.report.addAsSubparser(to: parser)
		addQueriesArgument(to: reportParser)
		addTemplateArgument(to: reportParser)
		addProjectArgument(to: reportParser)
		addSchemaArgument(to: reportParser)
		addOverrideSchemaArgument(to: reportParser)
		addDeprecationReportArgument(to: reportParser)
		let overwriteReportArg = addOverwriteReportArgument(to: reportParser)
		let verboseArg = addVerboseArgument(to:reportParser)

		// BINDING ARGUMENTS TO &options
		// The bound arguments below match across sub-parsers, since they are identical.

		binder.bind(positional: queriesArg) { (options, queries) in
			options.queries = queries.path
		}

		binder.bind(positional: destinationArg) { (options, destination) in
			options.destination = destination.path
		}

		binder.bind(positional: supportFilesArg) { (options, supportFilesDestination) in
			options.supportFilesDestination = supportFilesDestination.path
		}

		binder.bind(positional: templateArg) { (options, templatePath) in
			let workingDirectoryTemplate = AbsolutePath(templatePath, relativeTo: localFileSystem.currentWorkingDirectory!)
			if Arguments.isValidTemplate(workingDirectoryTemplate) {
				options.template = workingDirectoryTemplate
			} else {
				let absoluteTemplatePath: AbsolutePath
				if ProcessInfo.processInfo.environment["MINT"] == "YES" {
					absoluteTemplatePath = options.template.appending(component: templatePath)
				} else {
					absoluteTemplatePath = AbsolutePath(templatePath, relativeTo: options.template)
				}
				
				guard Arguments.isValidTemplate(absoluteTemplatePath) else {
					fatalError("Cannot read template file at path \(absoluteTemplatePath.asString)")
				}
				options.template = absoluteTemplatePath
			}
		}

		binder.bind(option: projectArg) { (options, pathArgument) in
			options.project = pathArgument.path
		}

		binder.bind(option: schemaArg) { (options, pathArgument) in
			options.schema = pathArgument.path
		}

		binder.bind(option: schemaOverrideArg) { (options, overridenSchema) in
			options.overridenSchema = overridenSchema
		}

		binder.bind(option: deprecationReportArg) { (options, deprecationReport) in
			options.deprecationReport = deprecationReport.path
		}

		binder.bind(option: overwriteReportArg) { (options, shouldOverwrite) in
			options.shouldOverwriteReport = shouldOverwrite
		}

		binder.bind(option: verboseArg) { (options, isVerbose) in
			options.verbose = isVerbose
		}
	}

	private func showError(_ error: Error) {
		print("ERROR: Syrup encountered an error\n\n")
		if let error = error as? ArgumentParserError {
			print(error.description, to: &stdoutStream)
			parser.printUsage(on: stdoutStream)
		} else {
			print(error.localizedDescription, to: &stdoutStream)
			stdoutStream.flush()
		}
		print("\n\n")
		exit(1)
	}
	
	func run() {
		var syrupArgs = Arguments()
		do {
			let commandLineArguments = CommandLine.arguments
			let arguments = Array(commandLineArguments.dropFirst())
			let parsedArguments = try parser.parse(arguments)
			try binder.fill(parseResult: parsedArguments, into: &syrupArgs)
			
			if syrupArgs.shouldPrintVersion {
				print("\(Syrup.version)", to: &stdoutStream)
				stdoutStream.flush()
			} else {
				let projectUrl = URL(fileURLWithPath: syrupArgs.project.asString)
				let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
				let schemaUrl = URL(fileURLWithPath: syrupArgs.schema.asString)
				var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
				if let overridenSchema = syrupArgs.overridenSchema {
					schema.location = overridenSchema
				}
				let template = try TemplateSpec(location: syrupArgs.template.asString)
				let config = SyrupCore.Config(
					shouldGenerateModels: syrupArgs.shouldGenerateModels,
					shouldGenerateSupportFiles: syrupArgs.shouldGenerateSupportFiles,
					queries: syrupArgs.queries.asString,
					destination: syrupArgs.destination.asString,
					supportFilesDestination: syrupArgs.supportFilesDestination.asString,
					template: template,
					project: project,
					schema: schema,
					verbose: syrupArgs.verbose,
					outputReportFilePath: syrupArgs.deprecationReport,
					shouldOverwriteReport: syrupArgs.shouldOverwriteReport
				)

				switch syrupArgs.command {
				case .report:
					let validator = Reporter(config: config)
					try validator.generateReport()
				default:
					let generator = Generator(config: config)
					try generator.generate()
				}
			}
		} catch let error {
			showError(error)
		}
	}

	@discardableResult
	private func addQueriesArgument(to parser: ArgumentParser) -> PositionalArgument<PathArgument> {
		return parser.add(positional: "queries", kind: PathArgument.self, usage: "This provides the path to the folder containing all of your graphql operation definitions. These files are expected to have the .graphql suffix and should be valid graphql operations.")
	}
	
	@discardableResult
	private func addDestinationArgument(to parser: ArgumentParser) -> PositionalArgument<PathArgument> {
		return parser.add(positional: "destination", kind: PathArgument.self, usage: "This provides the path to the folder where the generated code should be written to.")
	}
	
	@discardableResult
	private func addSupportFilesArgument(to parser: ArgumentParser) -> PositionalArgument<PathArgument> {
		return parser.add(positional: "supportFilesDestination", kind: PathArgument.self, usage: "This provides the path to the folder where the necessary support files should be written to.")
	}
	
	@discardableResult
	private func addTemplateArgument(to parser: ArgumentParser) -> PositionalArgument<String> {
		return parser.add(positional: "template", kind: String.self, usage: "This provides the path to the Templates folder that are included in the Syrup repository.", completion: .filename)
	}
	
	@discardableResult
	private func addProjectArgument(to parser: ArgumentParser) -> OptionArgument<PathArgument> {
		return parser.add(option: "--project", kind: PathArgument.self, usage: "YAML project configuration file")
	}

	@discardableResult
	private func addSchemaArgument(to parser: ArgumentParser) -> OptionArgument<PathArgument> {
		return parser.add(option: "--schema", kind: PathArgument.self, usage: "YAML schema configuration file")
	}

	@discardableResult
	private func addOverrideSchemaArgument(to parser: ArgumentParser) -> OptionArgument<String> {
		return parser.add(option: "--override-schema", kind: String.self, usage: "Overrides the projects schema location. Can be either a URL or a path on the filesystem.")
	}

	@discardableResult
	private func addDeprecationReportArgument(to parser: ArgumentParser) -> OptionArgument<PathArgument> {
		return parser.add(option: "--reports", kind: PathArgument.self, usage: "Deprecation report target output file.")
	}

	@discardableResult
	private func addOverwriteReportArgument(to parser: ArgumentParser) -> OptionArgument<Bool> {
		return parser.add(option: "--overwrite", shortName: "-ow", kind: Bool.self, usage: "Overwrite existing report.")
	}

	@discardableResult
	private func addVerboseArgument(to parser: ArgumentParser) -> OptionArgument<Bool> {
		return parser.add(option: "--verbose", shortName: "-vb", kind: Bool.self, usage: "Verbose output, reports on duplicates, etc.")
	}

}
