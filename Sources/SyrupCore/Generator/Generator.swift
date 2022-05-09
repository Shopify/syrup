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
import SwiftGraphQLParser

public final class Generator {
	let config: Config
	
	public init(config: Config) {
		self.config = config
	}
	
	private func operations(
		given rawOperations: [String: String],
		fallback operations: (queries: [String : String], mutations: [String : String], subscriptions: [String : String], fragments: [String : String])? = nil
	) throws -> (
		queries: [String : String],
		mutations: [String : String],
		subscriptions: [String : String],
		fragments: [String : String]
	) {
		try validateOperations(operations: rawOperations)
		
		let graphQLString = rawOperations.reduce(into: "") { accumulator, file in
			accumulator.append(contentsOf: "\n\(file.value)")
		}
		return try Generator.parseOperations(graphQLString: graphQLString)
	}
	
	public func generate() throws {
		let schema = try loadSchema(location: config.schema.location)
		if config.shouldGenerateModels {
			print("Generating models")
			try Folder.root.createSubfolderIfNeeded(at: config.destination)
			let rawOperations: [String: String] = try {
				switch config.filesToUpdate {
				case let .folder(path):
					return try FileParser.parseFiles(at: path)
				case let .files(paths):
					return try FileParser.parseFiles(at: paths)
				}
			}()
			let filesToBeUpdatedOperations = try operations(given: rawOperations)
			let fullOperations = try operations(given: try FileParser.parseFiles(at: config.queries))
			let selectionSets = try generateSelectionSets(schema: schema, queries: filesToBeUpdatedOperations.queries, mutations: filesToBeUpdatedOperations.mutations, subscriptions: filesToBeUpdatedOperations.subscriptions, fragments: filesToBeUpdatedOperations.fragments)
			let ir = try generateIntermediateRepresentation(schema: schema, customScalars: config.schema.customScalars, queries: filesToBeUpdatedOperations.queries, mutations: filesToBeUpdatedOperations.mutations, subscriptions: filesToBeUpdatedOperations.subscriptions, fragments: fullOperations.fragments)
			let generatedFiles: [File]
			switch config.template.specification.language {
			case .swift:
				generatedFiles = try renderGeneratedSwiftModels(intermediateRepresentation: ir, selectionSets: selectionSets)
			case .kotlin:
				generatedFiles = try renderGeneratedKotlinModels(intermediateRepresentation: ir, selectionSets: selectionSets)
			case .typescript:
				generatedFiles = try renderGeneratedTypeScriptModels(intermediateRepresentation: ir, selectionSets: selectionSets)
			}
			
			if config.deprecationReport != nil {
				try Reporter(config: config).process(ir: ir)
			}
			
			print("Successfully wrote generated models to \(config.destination)")
			
			if config.shouldCleanupFiles {
				try cleanup(folder: try Folder(path: config.destination), generated: Set(generatedFiles))
			}
		}
		
		if config.shouldGenerateSupportFiles {
			print("Generating support files")
			try Folder.root.createSubfolderIfNeeded(at: config.supportFilesDestination)
			switch config.template.specification.language {
			case .swift:
				try renderGeneratedSwiftSupportFiles()
			case .kotlin:
				try renderGeneratedKotlinSupportFiles()
			case .typescript:
				try renderGeneratedTypeScriptSupportFiles()
			}
			print("Successfully wrote generated support files to \(config.supportFilesDestination)")
		}
	}
	
	private func cleanup(folder: Folder, generated: Set<File>) throws {
		try folder.files.recursive.forEach { file in
			if !generated.contains(file) {
				try file.delete()
			}
		}
	}
	
	private enum FileType {
		case query
		case response
		case fragment
		case mutation
		case subscription
		case input
		case `enum`
		
		var directory: String {
			switch self {
			case .query:
				return "Queries"
			case .response:
				return "Responses"
			case .fragment:
				return "Fragments"
			case .mutation:
				return "Mutations"
			case .subscription:
				return "Subscriptions"
			case .input:
				return "Inputs"
			case .enum:
				return "Enums"
			}
		}
		
		var file: String {
			switch self {
			case .query:
				return "Query"
			case .response:
				return "Response"
			case .mutation:
				return "Mutation"
			case .subscription:
				return "Subscription"
			case .fragment, .input, .enum:
				return ""
			}
		}
	}
	
	struct ValidationError: LocalizedError {
		let fileName: String
		let error: Error
		
		var errorDescription: String? {
			"Error parsing \(fileName): \(error.localizedDescription)"
		}
	}
	
	func validateOperations(operations: [String: String]) throws {
		for (file, operation) in operations {
			do {
				_ = try parse(operation)
			} catch let error {
				throw ValidationError(fileName: file, error: error)
			}
		}
	}
	
	public static func parseOperations(graphQLString: String) throws -> (queries: [String: String], mutations: [String: String], subscriptions: [String: String], fragments: [String: String]) {
		print("Parsing .graphql files")
		let visitor = OperationVisitor()
		let document = try parse(graphQLString)
		let traverser = GraphQLTraverser(document: document, with: visitor)
		try traverser.traverse()
		return (visitor.queries, visitor.mutations, visitor.subscriptions, visitor.fragments)
	}
	
	func generateIntermediateRepresentation(schema: Schema, customScalars: [ScalarType], queries: [String: String], mutations: [String: String], subscriptions: [String: String], fragments: [String: String]) throws -> IntermediateRepresentation {
		let visitor = IntermediateRepresentationVisitor(schema: schema, customScalars: customScalars, builtInScalars: config.template.specification.builtInScalars, queries: queries, mutations: mutations, subscriptions: subscriptions, fragments: fragments)
		let document = try parse(queries: queries.map { $0.value }, mutations: mutations.map { $0.value }, subscriptions: subscriptions.map { $0.value }, fragments: fragments.map { $0.value })
		let traverser = GraphQLTraverser(document: document, with: visitor)
		try traverser.traverse()
		return visitor.intermediateRepresentation
	}
	
	func generateSelectionSets(schema: Schema, queries: [String: String], mutations: [String: String], subscriptions: [String: String], fragments: [String: String]) throws -> SelectionSetVisitor.Results {
		let visitor = SelectionSetVisitor(schema: schema)
		let document = try parse(queries: queries.map { $0.value }, mutations: mutations.map { $0.value }, subscriptions: subscriptions.map { $0.value }, fragments: fragments.map { $0.value })
		let traverser = GraphQLTraverser(document: document, with: visitor)
		try traverser.traverse()
		return visitor.results
	}
	
	func generateSelectionSets(
		schema: Schema,
		operations: (queries: [String: String], mutations: [String: String], subscriptions: [String: String], fragments: [String: String]),
		fallbackOperations: (queries: [String: String], mutations: [String: String], subscriptions: [String: String], fragments: [String: String])
	) throws -> SelectionSetVisitor.Results {
		fatalError()
//		let visitor = SelectionSetVisitor(schema: schema)
//		let document = try parse(queries: queries.map { $0.value }, mutations: mutations.map { $0.value }, subscriptions: subscriptions.map { $0.value }, fragments: fragments.map { $0.value })
//		let traverser = GraphQLTraverser(document: document, with: visitor)
//		try traverser.traverse()
//		return visitor.results
	}
	
	private func render<T: NamedItem>(intermediateRepresentation: IntermediateRepresentation, namesClosure: (IntermediateRepresentation) -> [T], fileType: FileType, renderer: (IntermediateRepresentation) throws -> [String]) throws -> [File] {
		let generatedFilesFolder = try Folder(path: config.destination)
		let folder = try generatedFilesFolder.createSubfolderIfNeeded(withName: fileType.directory)
		print("Writing to \(fileType.directory)")
		var generatedFiles: [File] = []
		for generated in zip(namesClosure(intermediateRepresentation), try renderer(intermediateRepresentation)) {
			let filename = "\(generated.0.name)\(fileType.file)\(config.project.filenameSuffix ?? "").\(config.template.specification.extension)"
			if config.verbose {
				print("🥊 \(filename)")
			}
			let file = try folder.createFile(named: filename)
			let rendered = generated.1
			try file.write(rendered)
			generatedFiles.append(file)
		}
		return generatedFiles
	}
	
	func renderGeneratedKotlinModels(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [File] {
		let operationQueue = OperationQueue()
		var files: Synchronized<[File]> = Synchronized([])
		var error: Synchronized<Error?> = Synchronized(nil)
		
		func concurrentPerform(block: @escaping () throws -> [File]) {
			operationQueue.addOperation {
				do {
					let results = try block()
					files.value.append(contentsOf: results)
				} catch let thrownError {
					error.value = thrownError
					operationQueue.cancelAllOperations()
				}
			}
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.queries }, fileType: .query, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.queries)
			})
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.mutations }, fileType: .mutation, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.mutations)
			})
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations }, fileType: .response, renderer: renderer.renderResponseTypes)
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.fragmentDefinitions }, fileType: .fragment, renderer: { (ir) -> [String] in
				try renderer.renderFragmentDefinitions(intermediateRepresentation: ir, selectionSets: selectionSets)
			})
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.subscriptions }, fileType: .subscription, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.subscriptions)
			})
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedInputTypes }, fileType: .input, renderer: renderer.renderInputTypes)
		}
		
		concurrentPerform {
			let renderer = KotlinRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedEnums }, fileType: .enum, renderer: renderer.renderEnumTypes)
		}
		
		operationQueue.waitUntilAllOperationsAreFinished()
		if let error = error.value {
			throw error
		}
		return files.value
	}
	
	func renderGeneratedKotlinSupportFiles() throws {
		let renderer = KotlinRenderer(config: config)
		let supportFilesFolder = try Folder(path: config.supportFilesDestination)
		
		var file = try supportFilesFolder.createFile(named: "GraphApi.\(config.template.specification.extension)")
		var rendered = try renderer.renderGraphApi()
		try file.write(rendered)
		
		file = try supportFilesFolder.createFile(named: "InputWrapper.\(config.template.specification.extension)")
		rendered = try renderer.renderInputWrapper()
		try file.write(rendered)
		
		try file.write(rendered) // ?
	}
	
	func renderGeneratedSwiftModels(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [File] {
		let operationQueue = OperationQueue()
		var files: Synchronized<[File]> = Synchronized([])
		var error: Synchronized<Error?> = Synchronized(nil)
		
		func concurrentPerform(block: @escaping () throws -> [File]) {
			operationQueue.addOperation {
				do {
					let results = try block()
					files.value.append(contentsOf: results)
				} catch let thrownError {
					error.value = thrownError
					operationQueue.cancelAllOperations()
				}
			}
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.fragmentDefinitions }, fileType: .fragment, renderer: { (ir) -> [String] in
				try renderer.renderFragmentDefinitions(intermediateRepresentation: ir, selectionSets: selectionSets)
			})
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.queries }, fileType: .query, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.queries)
			})
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.mutations }, fileType: .mutation, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.mutations)
			})
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations }, fileType: .response, renderer: renderer.renderResponseTypes)
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.subscriptions }, fileType: .subscription, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.subscriptions)
			})
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedInputTypes }, fileType: .input, renderer: renderer.renderInputTypes)
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedEnums }, fileType: .enum, renderer: renderer.renderEnumTypes)
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			let generatedFilesFolder = try Folder.root.createSubfolderIfNeeded(at: self.config.destination)
			let customCodedScalars = self.config.schema.customScalars.compactMap { $0 as? IntermediateRepresentation.CustomCodedScalar }
			if customCodedScalars.isEmpty == false {
				let file = try generatedFilesFolder.createFile(named: "CustomScalarResolver.\(self.config.template.specification.extension)")
				let rendered = try renderer.renderCustomScalarResolver(customScalars: customCodedScalars)
				try file.write(rendered)
				return [file]
			}
			return []
		}
		
		concurrentPerform {
			let renderer = SwiftRenderer(config: self.config)
			let generatedFilesFolder = try Folder.root.createSubfolderIfNeeded(at: self.config.destination)
			let file = try generatedFilesFolder.createFile(named: "\(self.config.project.moduleName).\(self.config.template.specification.extension)")
			
			let rendered = try renderer.renderModuleDefinition(moduleName: self.config.project.moduleName, hasCustomCodedScalars: !self.config.schema.customScalars.isEmpty)
			try file.write(rendered)
			return [file]
		}
		
		operationQueue.waitUntilAllOperationsAreFinished()
		if let error = error.value {
			throw error
		}
		return files.value
	}
	
	func renderGeneratedSwiftSupportFiles() throws {
		let renderer = SwiftRenderer(config: config)
		let supportFilesFolder = try Folder.root.createSubfolderIfNeeded(at: config.supportFilesDestination)
		
		let file = try supportFilesFolder.createFile(named: "GraphApi.\(config.template.specification.extension)")
		let rendered = try renderer.renderGraphApi()
		try file.write(rendered)
	}
	
	func renderGeneratedTypeScriptModels(intermediateRepresentation: IntermediateRepresentation, selectionSets: SelectionSetVisitor.Results) throws -> [File] {
		let operationQueue = OperationQueue()
		var files: Synchronized<[File]> = Synchronized([])
		var error: Synchronized<Error?> = Synchronized(nil)
		
		func concurrentPerform(block: @escaping () throws -> [File]) {
			operationQueue.addOperation {
				do {
					let results = try block()
					files.value.append(contentsOf: results)
				} catch let thrownError {
					error.value = thrownError
					operationQueue.cancelAllOperations()
				}
			}
		}
		
		concurrentPerform {
			let renderer = TypeScriptRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.queries }, fileType: .query, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.queries)
			})
		}
		
		concurrentPerform {
			let renderer = TypeScriptRenderer(config: self.config)
			
			return try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.operations.mutations }, fileType: .mutation, renderer: { (ir) -> [String] in
				try renderer.renderOperations(intermediateRepresentation: ir, selectionSets: selectionSets, operations: ir.operations.mutations)
			})
		}
		
		concurrentPerform {
			let renderer = TypeScriptRenderer(config: self.config)
			let generatedEnums = try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedEnums }, fileType: .enum, renderer: renderer.renderEnumTypes)
			let generatedExportFile = try self.renderTypeScriptExportFile(fileType: .enum, renderer: { () throws -> String in
				try renderer.renderEnumEntryPoint(intermediateRepresentation: intermediateRepresentation)
			})
			
			return generatedEnums + [generatedExportFile]
		}
		
		concurrentPerform {
			let renderer = TypeScriptRenderer(config: self.config)
			let generatedInputTypes = try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.referencedInputTypes }, fileType: .input, renderer: renderer.renderInputTypes)
			let generatedExportFile = try self.renderTypeScriptExportFile(fileType: .input, renderer: { () throws -> String in
				try renderer.renderInputTypeEntryPoint(intermediateRepresentation: intermediateRepresentation)
			})
			
			return generatedInputTypes + [generatedExportFile]
		}
		
		concurrentPerform {
			let renderer = TypeScriptRenderer(config: self.config)
			let generatedFragments = try self.render(intermediateRepresentation: intermediateRepresentation, namesClosure: { $0.fragmentDefinitions }, fileType: .fragment, renderer: { (ir) -> [String] in
				try renderer.renderFragmentDefinitions(intermediateRepresentation: ir, selectionSets: selectionSets)
			})
			let generatedExportFile = try self.renderTypeScriptExportFile(fileType: .fragment, renderer: { () throws -> String in
				try renderer.renderFragmentEntryPoint(intermediateRepresentation: intermediateRepresentation)
			})
			
			return generatedFragments + [generatedExportFile]
		}
		
		operationQueue.waitUntilAllOperationsAreFinished()
		if let error = error.value {
			throw error
		}
		return files.value
	}
	
	func renderGeneratedTypeScriptSupportFiles() throws {
		let renderer = TypeScriptRenderer(config: config)
		let supportFilesFolder = try Folder.root.createSubfolderIfNeeded(at: config.supportFilesDestination)
		
		let file = try supportFilesFolder.createFile(named: "GraphApi.\(config.template.specification.extension)")
		let rendered = try renderer.renderGraphApi()
		try file.write(rendered)
	}
	
	private func renderTypeScriptExportFile(fileType: FileType, renderer: () throws -> String) throws -> File {
		let generatedFilesFolder = try Folder.root.createSubfolderIfNeeded(at: self.config.destination)
		let inputFilesFolder = try generatedFilesFolder.createSubfolderIfNeeded(at: fileType.directory)
		let file = try inputFilesFolder.createFile(named: "index.\(self.config.template.specification.extension)")
		try file.write(renderer())
		
		return file
	}
}

extension File: Hashable {
	public func hash(into hasher: inout Hasher) {
		hasher.combine(path)
	}
}
