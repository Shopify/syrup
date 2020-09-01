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
import Files
import Foundation
import SwiftGraphQLParser

public final class Reporter {
	let config: Config
	let validationTime: Date = Date()
	let dateFormatter = DateFormatter()

	let ymlReportFilename = "report.yml"
	let mdReportFilename = "report.md"

	public init(config: Config) {
		self.config = config
		self.dateFormatter.dateFormat = "yy-MM-dd"
	}

	public func generateReport() throws {
		let schema = try loadSchema(location: config.schema.location)

		let queryFolder = try Folder(path: config.queries)

		let graphQLFiles = try queryFolder.fetchGraphQLFiles()
		let graphQLString = graphQLFiles.reduce("", { (result, element) -> String in result + "\n" + element.value })
		let document = try SwiftGraphQLParser.parse(graphQLString)

		let opsVisitor = OperationVisitor()
		let opsTraverser = GraphQLTraverser(document: document, with: opsVisitor)
		try opsTraverser.traverse()

		let irVisitor = IntermediateRepresentationVisitor(
				schema: schema,
				customScalars: config.schema.customScalars,
				builtInScalars: config.template.specification.builtInScalars,
				queries: opsVisitor.queries,
				mutations: opsVisitor.mutations,
				subscriptions: opsVisitor.subscriptions,
				fragments: opsVisitor.fragments
		)

		let irTraverser = GraphQLTraverser(document: document, with: irVisitor)
		try irTraverser.traverse()

		let ir = irVisitor.intermediateRepresentation
		try process(ir: ir)
	}

	func process(ir: IntermediateRepresentation) throws {
		// ParentType: operation or fragment?
		// String: complete key to operation, i.e.  `CustomerDetail.customer.lastOrder.totalPrice`
		// Date: date the deprecation was found? (or expiry date for whitelist..)
		var newDeprecations = [DeprecationType: [String: Date]]()
		
		if config.verbose {
			print("\n[OPERATIONS]".ansi("1;35"))
		}
		let foundFields = ir.operations.findFields(verbose: config.verbose)
		let deprecatedOpFields = foundFields.filter { $0.value.attributes.isDeprecated }
		
		if config.verbose {
			print("Found \(ir.operations.count) operations with \(foundFields.count) fields, \(deprecatedOpFields.count) deprecated.".ansi("33"))
		}
		newDeprecations[.Operation] = Dictionary(uniqueKeysWithValues: deprecatedOpFields.map { (key, value) in
			(key.joined(separator: "."), validationTime)
		})
		
		if config.verbose {
			print("\n[FRAGMENTS]".ansi("1;35"))
		}
		let fragFields = ir.fragmentDefinitions.findFields(verbose: config.verbose)
		let deprecatedFragFields = fragFields.filter { $0.value.attributes.isDeprecated }
		if config.verbose {
			print("Found \(ir.fragmentDefinitions.count) fragments with \(fragFields.count) fields, \(deprecatedFragFields.count) deprecated.".ansi("33"))
		}
		newDeprecations[.Fragment] = Dictionary(uniqueKeysWithValues: deprecatedFragFields.map { (key, value) in
			(key.joined(separator: "."), validationTime)
		})
		
		if config.verbose {
			print("\n[ENUMS] ".ansi("1;35") + "NOTE: Currently unused".ansi("3;90"))
		}
		let enumDeprecatedCount = ir.referencedEnums.filter { $0.attributes.isDeprecated }.count
		let enumValues = ir.referencedEnums
			.reduce(into: [IntermediateRepresentation.EnumType.Value]()) { $0 += $1.values }
		let deprecatedValCount = enumValues.filter { $0.attributes.isDeprecated }.count
		if config.verbose {
			print("\(ir.referencedEnums.count) referencedEnums (\(enumDeprecatedCount) deprecated), with \(enumValues.count) values (\(deprecatedValCount) deprecated).\u{001B}".ansi("33"))
		}
		
		if config.verbose {
			print("\n[INPUT TYPES] ".ansi("1;35")+"NOTE: Currently unused".ansi("3;90"))
		}
		let deprecatedInputCount = ir.referencedInputTypes.filter { $0.attributes.isDeprecated }.count
		if config.verbose {
			print("\(ir.referencedInputTypes.count) referencedInputTypes with \(deprecatedInputCount) deprecated.".ansi("33"))
		}
		
		// Output to console, report.yml and report.md
		if let outputReportPath = config.deprecationReport {
			let folder = try Folder(path: outputReportPath.asString)
			
			var mdReport = ""
			
			func outputTitle(overwrite: Bool) {
				print("\n\("[VALIDATION REPORT]".ansi("1;35")) \((overwrite ? "⌦OVERWRITTEN⌫".ansi("1;91") : ""))")
				mdReport += "VALIDATION REPORT".mdH1() 
					+ "\n*This report is automatically generated by Syrup validation tooling. Please avoid committing a manually edited version.*"
			}
			
			func outputHeader(typename: String) {
				print( "\t\("[DEPRECATED \(typename) FIELDS]".ansi("36"))" )
				mdReport += "\n"+"DEPRECATED \(typename) FIELDS\n".mdH2()
			}
			
			func outputDeprecated(element: (key: String, date: Date)) {
				print("\t\t\(dateFormatter.string(from: element.date))\t\(element.key)".ansiExpiryFlag(element.date))
				mdReport += "\(dateFormatter.string(from: element.date))\t`\(element.key)`".mdExpiryFlag(element.date) + "\n" // .todo()
			}
			
			func outputRemoved(element: (key: String, date: Date)) {
				print("\t\t\(dateFormatter.string(from: element.date)) 🧼\t\(element.key) [REMOVED]".ansi("92"))
			}
			
			outputTitle(overwrite: config.shouldOverwriteReport)
			if !config.shouldOverwriteReport && folder.containsFile(at: ymlReportFilename) {
				let yamlFile = try folder.file(named: ymlReportFilename)
				let oldReport: ReportSpec = try yamlFile.yamlRead()
				let oldDeprecations: [DeprecationType: [String: Date]] = try oldReport.toDictionary()
				let deprecations = combine(
					old: oldDeprecations,
					new: newDeprecations,
					headerHandler: outputHeader,
					existingHandler: outputDeprecated,
					removedHandler: outputRemoved)
				let combinedReport = ReportSpec(deprecations: deprecations)
				
				// Update the existing file with new findings.
				try yamlFile.yamlWrite(encodable: combinedReport)
				print("\nUpdated ".ansi("93") + yamlFile.path.ansi("96"))
				
				let mdFile = try folder.createFile(named: mdReportFilename)
				try mdFile.write(mdReport)
				print("Updated ".ansi("93") + mdFile.path.ansi("96"))
			} else {
				outputHeader(typename: "OPERATION")
				newDeprecations[.Operation]?
					.sorted { $0.key < $1.key }
					.forEach { element in outputDeprecated(element: element) }
				
				outputHeader(typename: "FRAGMENT")
				newDeprecations[.Fragment]?
					.sorted { $0.key < $1.key }
					.forEach { element in outputDeprecated(element: element) }
				
				let yamlFile = try folder.createFile(named: ymlReportFilename)
				try yamlFile.yamlWrite(encodable: ReportSpec(deprecations: newDeprecations))
				print("\nCreated ".ansi("93") + yamlFile.path.ansi("96"))
				
				let mdFile = try folder.createFile(named: mdReportFilename)
				try mdFile.write(mdReport)
				print("Created ".ansi("93") + mdFile.path.ansi("96"))
			}
		}
	}
	
	func combine(
		old: [DeprecationType: [String: Date]],
		new: [DeprecationType: [String: Date]],
		headerHandler: (String) -> Void,
		existingHandler: ((String, Date)) -> Void,
		removedHandler: ((String, Date)) -> Void
		
	) -> [DeprecationType: [String: Date]] {
		return DeprecationType.allCases.reduce(into: [DeprecationType: [String: Date]]()) { result, type in
			let oldType = old[type] ?? [:]
			let newType = new[type] ?? [:]
			
			result[type] = oldType.combineWith(new: newType)
			
			headerHandler(type.rawValue.uppercased())
			
			result[type]?
				.sorted { $0.key < $1.key }
				.forEach { existing in
					existingHandler(existing)
				}

			oldType
				.filterRemoved(new: newType)
				.sorted {
					return $0.key < $1.key
				}
				.forEach { removed in
					removedHandler(removed)
				}
		}
	}

}

let expiryDuration: Int = 14
let alertDuration: Int = 7

extension String {

	func ansi(_ code: String) -> String {
		return "\u{001B}[\(code)m\(self)\u{001B}[0m"
	}
	
	func mdH1() -> String { return "#\(self)" }
	func mdH2() -> String { return "##\(self)" }
	func mdH3() -> String { return "###\(self)" }

	func mdExpiryFlag(_ value: Date) -> String {
		let expiryDate = Calendar.current.date(byAdding: Calendar.Component.day, value: expiryDuration, to: value)!
		let warnDate = Calendar.current.date(byAdding: Calendar.Component.day, value: alertDuration, to: value)!
		let now = Date()
		if  expiryDate <= now {
			return self.mdAlert().mdTodo()
		} else if warnDate <= now {
			return self.mdWarn().mdTodo()
		} else {
			return self.mdTodo()
		}
	}
	
	func mdTodo() -> String { return "- \(self)" }
	func mdAlert() -> String { return self.mdSpan("color:red") + " 🚨" }
	func mdWarn() -> String { return self.mdSpan("color:darkorange") + " ⚠️" }
	func mdSpan(_ style: String) -> String { return "<span style=\"\(style)\">\(self)</span>" }

	func ansiExpiryFlag(_ value: Date) -> String {
		let expiryDate = Calendar.current.date(byAdding: Calendar.Component.day, value: expiryDuration, to: value)!
		let warnDate = Calendar.current.date(byAdding: Calendar.Component.day, value: alertDuration, to: value)!
		let now = Date()
		if  expiryDate <= now {
			return self.ansiAlert()
		} else if warnDate <= now {
			return self.ansiWarn()
		} else {
			return self
		}
	}

	func ansiAlert() -> String { return self.ansi("31") + " 🚨" }
	func ansiWarn() -> String { return self.ansi("33") + " ⚠️" }

}

extension Dictionary where Key == String, Value == Date {
	func filterRemoved(new: [Key: Value]) -> [Key: Value] {
		return self.filter { key, value in !new.keys.contains(key) }
	}
}

extension Dictionary { // where Key == String, Value == Date {
	func combineWith(new: [Key: Value]) -> [Key: Value] {
		// We default to our existing/self copy, if none exist we add the new one.
		return new.reduce(into: [Key: Value]()) { result, element in
			result[element.key] = self[element.key] ?? element.value
		}
	}
}

enum ValidationError: Error {
	case readError
}

extension File {
	func yamlRead<T: Decodable>() throws -> T {
		return try YAMLDecoder().decode(T.self, from: URL(fileURLWithPath: self.path), userInfo: [:])
	}

	func yamlWrite<T: Encodable>(encodable: T) throws {
		let content = try YAMLEncoder().encode(encodable)
		try self.write(content)
	}

	func load(withEncoding fileEncoding: String.Encoding = .utf8) throws -> String {
		if let stringData = String(data: try self.read(), encoding: .utf8) {
			return stringData
		} else {
			throw ValidationError.readError
		}
	}
}

extension Sequence where Iterator.Element == File {
	func toLoaded() throws -> [String: String] {
		return try self.reduce(into: [String: String]()) { (results, file) in
			results[file.name] = try file.load()
		}
	}
}

extension Folder {
	func fetchGraphQLFiles(suffix: String = "graphql") throws -> [String: String] {
		return try self.files.recursive
				.filter { (file: File) in file.extension == suffix }
				.toLoaded()
	}
}
