import Files
import XCTest
import Yams
@testable import SyrupCore

class SwiftTests: XCTestCase {
	static var recordMode: Bool {
		guard let recordEnv = ProcessInfo.processInfo.environment["RECORD"], let record = Bool(recordEnv) else {
			return false
		}
		return record
	}

	var baseURL: URL {
		var url = URL(fileURLWithPath: #file)
		url.deleteLastPathComponent()
		return url
	}

	var testResourcesURL: URL {
		return baseURL.appendingPathComponent("TestResources", isDirectory: true)
	}

	var resourcesURL: URL {
		return baseURL.appendingPathComponent("../Resources", isDirectory: true)
	}

	func assertGeneratedCode(language: String, recordMode: Bool = SwiftTests.recordMode, file: StaticString = #file, line: UInt = #line) throws {
		let queries = resourcesURL.appendingPathComponent("TestOperations/\(language)").path
		let expectedDestinationURL = resourcesURL.appendingPathComponent("Expected\(language)Code")
		let destinationURL: URL
		if recordMode {
			destinationURL = expectedDestinationURL
		} else {
			destinationURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(UUID().uuidString, isDirectory: true)
		}
		let destination = destinationURL.path
		let supportFilesDestination = destination

		let projectUrl = testResourcesURL.appendingPathComponent("Shopify-\(language).yml")
		let project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
		let schemaUrl = testResourcesURL.appendingPathComponent("Shopify-\(language).yml")
		var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
		schema.location = testResourcesURL.appendingPathComponent("Shopify-Schema.json").path

		let templateURL = baseURL.appendingPathComponent("../../Sources/Syrup/Resources/Templates/\(language)", isDirectory: true)
		let template = try TemplateSpec(location: templateURL.path)

		let config = SyrupCore.Config(
			shouldGenerateModels: true,
			shouldGenerateSupportFiles: true,
			queries: queries,
			destination: destination,
			supportFilesDestination: supportFilesDestination,
			template: template,
			project: project,
			schema: schema,
			verbose: false,
			outputReportFilePath: nil,
			shouldOverwriteReport: false
		)
		let generator = Generator(config: config)
		try generator.generate()

		if recordMode {
			XCTFail("Running in record mode")
		} else {
			let expectedFilesFolder = try Folder(path: expectedDestinationURL.path)
			let generatedFilesFolder = try Folder(path: destinationURL.path)
			XCTAssertNoThrow(try Folder.compareContents(expected: expectedFilesFolder, actual: generatedFilesFolder), file: file, line: line)
			try generatedFilesFolder.delete()
		}
	}

	func testSwiftGeneratedFiles() throws {
		try assertGeneratedCode(language: "Swift")
	}

	func testKotlinGeneratedFiles() throws {
		try assertGeneratedCode(language: "Kotlin")
	}

	func testTypeScriptGeneratedFiles() throws {
		try assertGeneratedCode(language: "TypeScript")
	}

	// MARK: - Comment Rendering Tests

	func testTypeScriptCommentRenderingDefault() throws {
		// Default mode should include all comments
		let output = try generateTypeScriptEnum(commentRendering: .comments)

		// Should include regular descriptions
		XCTAssertTrue(output.contains("United States Dollars (USD)."), "Default mode should include regular descriptions")
		// Should include deprecation warnings
		XCTAssertTrue(output.contains("@deprecated"), "Default mode should include @deprecated warnings")
		XCTAssertTrue(output.contains("`BYR` is deprecated"), "Default mode should include deprecation reason")
	}

	func testTypeScriptCommentRenderingNoComments() throws {
		// No comments mode should exclude all comments
		let output = try generateTypeScriptEnum(commentRendering: .noComments)

		// Should NOT include JSDoc comments at all
		XCTAssertFalse(output.contains("/**"), "No-comments mode should not include any JSDoc comments")
		XCTAssertFalse(output.contains("United States Dollars"), "No-comments mode should not include descriptions")
		XCTAssertFalse(output.contains("@deprecated"), "No-comments mode should not include @deprecated warnings")

		// But should still have the enum values
		XCTAssertTrue(output.contains("Usd = \"USD\""), "Should still have enum values")
		XCTAssertTrue(output.contains("Byr = \"BYR\""), "Should still have deprecated enum values")
	}

	func testTypeScriptCommentRenderingOnlyDeprecations() throws {
		// Only-deprecations mode should only include @deprecated comments
		let output = try generateTypeScriptEnum(commentRendering: .onlyDeprecations)

		// Should NOT include regular descriptions
		XCTAssertFalse(output.contains("United States Dollars (USD)."), "Only-deprecations mode should not include regular descriptions")

		// Should include deprecation warnings
		XCTAssertTrue(output.contains("@deprecated"), "Only-deprecations mode should include @deprecated warnings")
		XCTAssertTrue(output.contains("`BYR` is deprecated"), "Only-deprecations mode should include deprecation reason")
	}

	private func generateTypeScriptEnum(commentRendering: CommentRendering) throws -> String {
		let queries = resourcesURL.appendingPathComponent("TestOperations/TypeScript").path
		let destinationURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory: true).appendingPathComponent(UUID().uuidString, isDirectory: true)
		let destination = destinationURL.path

		let projectUrl = testResourcesURL.appendingPathComponent("Shopify-TypeScript.yml")
		var project = try YAMLDecoder().decode(ProjectSpec.self, from: projectUrl, userInfo: [:])
		project.commentRendering = commentRendering

		let schemaUrl = testResourcesURL.appendingPathComponent("Shopify-TypeScript.yml")
		var schema = try YAMLDecoder().decode(SchemaSpec.self, from: schemaUrl, userInfo: [:])
		schema.location = testResourcesURL.appendingPathComponent("Shopify-Schema.json").path

		let templateURL = baseURL.appendingPathComponent("../../Sources/Syrup/Resources/Templates/TypeScript", isDirectory: true)
		let template = try TemplateSpec(location: templateURL.path)

		let config = SyrupCore.Config(
			shouldGenerateModels: true,
			shouldGenerateSupportFiles: false,
			queries: queries,
			destination: destination,
			supportFilesDestination: destination,
			template: template,
			project: project,
			schema: schema,
			verbose: false,
			outputReportFilePath: nil,
			shouldOverwriteReport: false
		)
		let generator = Generator(config: config)
		try generator.generate()

		// Read the generated CurrencyCode enum file (has both regular and deprecated values)
		let enumFile = try Folder(path: destinationURL.path)
			.subfolder(named: "Enums")
			.file(named: "CurrencyCode.ts")
		let output = try String(data: enumFile.read(), encoding: .utf8) ?? ""

		// Cleanup
		try Folder(path: destinationURL.path).delete()

		return output
	}
}

extension Folder {
	enum ComparisonError: Swift.Error {
		case differentFiles(folder: String, expected: [String], actual: [String])
		case differentSubfolders(folder: String, expected: [String], actual: [String])
	}

	static func compareContents(expected: Folder, actual: Folder) throws {
		let expectedFileNames = expected.files.map { $0.name }.sorted()
		let actualFileNames = actual.files.map { $0.name }.sorted()
		guard expectedFileNames == actualFileNames else {
			throw ComparisonError.differentFiles(folder: expected.name, expected: expectedFileNames, actual: actualFileNames)
		}
		for (lhsFile, rhsFile) in zip(expected.files.sortedByName(), actual.files.sortedByName()) {
			try File.compareContents(expected: lhsFile, actual: rhsFile)
		}

		let expectedNonEmptySubfolders = expected.subfolders.filter { !$0.isEmpty }.sortedByName()
		let actualNonEmptySubfolders = actual.subfolders.filter { !$0.isEmpty }.sortedByName()
		let expectedSubfolderNames = expectedNonEmptySubfolders.map { $0.name }
		let actualSubfolderNames = actualNonEmptySubfolders.map { $0.name }
		guard expectedSubfolderNames == actualSubfolderNames else {
			throw ComparisonError.differentSubfolders(folder: expected.name, expected: expectedSubfolderNames, actual: actualSubfolderNames)
		}
		for (lhsFolder, rhsFolder) in zip(expectedNonEmptySubfolders, actualNonEmptySubfolders) {
			try Folder.compareContents(expected: lhsFolder, actual: rhsFolder)
		}
	}

	var isEmpty: Bool {
		return (files.count() == 0 && subfolders.count() == 0)
	}
}

extension File {
	enum ComparisonError: Swift.Error {
		case fileContentsDoNotMatch(file: String, expectedLine: String?, actualLine: String?)
	}
	static func compareContents(expected: File, actual: File) throws {
		let expectedContents = String(data: try expected.read(), encoding: .utf8)?.split(separator: "\n") ?? []
		let actualContents = String(data: try actual.read(), encoding: .utf8)?.split(separator: "\n") ?? []

		var actualContentsIterator = actualContents.makeIterator()
		for expectedLine in expectedContents {
			guard let actualLine = actualContentsIterator.next() else {
				throw ComparisonError.fileContentsDoNotMatch(file: expected.name, expectedLine: String(expectedLine), actualLine: nil)
			}
			if expectedLine != actualLine {
				throw ComparisonError.fileContentsDoNotMatch(file: expected.name, expectedLine: String(expectedLine), actualLine: String(actualLine))
			}
		}

		if let extraLine = actualContentsIterator.next() {
			throw ComparisonError.fileContentsDoNotMatch(file: expected.name, expectedLine: nil, actualLine: String(extraLine))
		}
	}
}

extension Sequence where Element: Location {
	func sortedByName() -> [Element] {
		return self.sorted(by: { (lhs, rhs) -> Bool in
			return lhs.name < rhs.name
		})
	}
}
