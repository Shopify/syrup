@testable import Syrup
import XCTest

final class SyrupTests: XCTestCase {
	func testMissingSomethingForGenerate() {
		let subcommand = ["generate"]
		let positionalArguments = [
			"path/to/queries",
			"path/to/destination",
			"path/to/support-files",
			"path/to/template",
		]
		let optionArguments = [
			"--project=<project>",
			"--schema=<schema>",
			"--override-schema=<override-schema>",
			"--reports=<reports>",
		]
		
		for index in 1 ..< positionalArguments.count {
			let copyOfPositionalArguments = positionalArguments.dropLast(index)
			
			XCTAssertThrowsError(try Syrup.parse(subcommand + copyOfPositionalArguments + optionArguments))
		}
		
		XCTAssertNoThrow(try Syrup.parseAsRoot(subcommand + positionalArguments + optionArguments))
	}
	
	func testMissingSomethingForGenerateModels() {
		let subcommand = ["generate-models"]
		let positionalArguments = [
			"path/to/queries",
			"path/to/destination",
			"path/to/template",
		]
		let optionArguments = [
			"--project=<project>",
			"--schema=<schema>",
			"--override-schema=<override-schema>",
			"--reports=<reports>",
		]
		
		for index in 1 ..< positionalArguments.count {
			let copyOfPositionalArguments = positionalArguments.dropLast(index)
			
			XCTAssertThrowsError(try Syrup.parse(subcommand + copyOfPositionalArguments + optionArguments))
		}
		
		XCTAssertNoThrow(try Syrup.parseAsRoot(subcommand + positionalArguments + optionArguments))
	}
	
	func testMissingSomethingForGenerateSupportFiles() {
		let subcommand = ["generate-support-files"]
		let positionalArguments = [
			"path/to/support-files",
			"path/to/template",
		]
		let optionArguments = [
			"--project=<project>",
			"--schema=<schema>",
			"--override-schema=<override-schema>",
		]
		
		for index in 1 ..< positionalArguments.count {
			let copyOfPositionalArguments = positionalArguments.dropLast(index)
			
			XCTAssertThrowsError(try Syrup.parse(subcommand + copyOfPositionalArguments + optionArguments))
		}
		
		XCTAssertNoThrow(try Syrup.parseAsRoot(subcommand + positionalArguments + optionArguments))
	}
	
	func testMissingSomethingForReport() {
		let subcommand = ["report"]
		let positionalArguments = [
			"path/to/queries",
			"path/to/template",
		]
		let optionArguments = [
			"--project=<project>",
			"--schema=<schema>",
			"--override-schema=<override-schema>",
			"--reports=<reports>",
		]
		let flags = ["--overwrite", "--verbose"]
		
		for index in 1 ..< positionalArguments.count {
			let copyOfPositionalArguments = positionalArguments.dropLast(index)
			
			XCTAssertThrowsError(try Syrup.parse(subcommand + copyOfPositionalArguments + optionArguments))
		}
		
		XCTAssertNoThrow(try Syrup.parseAsRoot(subcommand + positionalArguments + optionArguments))
		XCTAssertNoThrow(try Syrup.parseAsRoot(subcommand + positionalArguments + optionArguments + flags))
	}
	
	func testHelp() throws {
		XCTAssertNoThrow(try Syrup.parseAsRoot(["--help"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["-h"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate", "--help"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate", "-h"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate-models", "--help"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate-models", "-h"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate-support-files", "--help"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["generate-support-files", "-h"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["report", "--help"]))
		XCTAssertNoThrow(try Syrup.parseAsRoot(["report", "-h"]))
	}
}
