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
	
	@OptionGroup()
	var output: Output
	
	@OptionGroup()
	var templateInput: TemplateInput
	
	@Flag(help: "Verbose output, reports on duplicates, etc.")
	var verbose = false
	
	func run() throws {
		let project: ProjectSpec
		if let projectURL = input.project?.file.url {
			project = try YAMLDecoder().decode(ProjectSpec.self, from: projectURL, userInfo: [:])
		} else {
			project = ProjectSpec(moduleName: input.workingDirectory.nameExcludingExtension)
		}
		
		let scalars: ScalarSpec
		if let scalarsFile = input.scalars {
			scalars = try YAMLDecoder().decode(ScalarSpec.self, from: scalarsFile.url, userInfo: [:])
		} else {
			scalars = ScalarSpec()
		}

		let template = try TemplateSpec(location: templateInput.resolvedTemplateFolder!.path)

		let config = SyrupCore.Config(
			schema: input.schema,
			shouldGenerateModels: output.generateModels,
			shouldGenerateSupportFiles: output.generateSupport,
			queries: try input.queries.resolve().path,
			destination: try output.destination.resolve().path,
			supportFilesDestination: try output.supportFilesDestination.resolve().path,
			template: template,
			project: project,
			scalars: scalars,
			verbose: verbose
		)

		if output.generateModels || output.generateSupport {
			let generator = Generator(config: config)
			try generator.generate()
		}
	}
}
