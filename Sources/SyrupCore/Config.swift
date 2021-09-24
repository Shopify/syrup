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

import TSCBasic
import Foundation

public struct Config {
	var shouldGenerateModels: Bool
	var shouldGenerateSupportFiles: Bool
	var queries: String
	var destination: String
	var supportFilesDestination: String
	var template: TemplateSpec
	var project: ProjectSpec
	var schema: SchemaSpec
	var verbose: Bool
	var deprecationReport: AbsolutePath? = nil
	var shouldOverwriteReport: Bool = false

	public init(shouldGenerateModels: Bool, shouldGenerateSupportFiles: Bool, queries: String, destination: String, supportFilesDestination: String, template: TemplateSpec, project: ProjectSpec, schema: SchemaSpec, verbose: Bool, outputReportFilePath: AbsolutePath?, shouldOverwriteReport: Bool) {
		self.shouldGenerateModels = shouldGenerateModels
		self.shouldGenerateSupportFiles = shouldGenerateSupportFiles
		self.queries = queries
		self.destination = destination
		self.supportFilesDestination = supportFilesDestination
		self.template = template
		self.project = project
		self.schema = schema
		self.verbose = verbose
		self.deprecationReport = outputReportFilePath
		self.shouldOverwriteReport = shouldOverwriteReport
	}
}
