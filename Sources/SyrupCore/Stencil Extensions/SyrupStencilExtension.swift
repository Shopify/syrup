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
import Stencil

final class SyrupStencilExtension: Extension {
	override init() {
		super.init()
		registerDefaultTags()
		registerDefaultFilters()
	}
	
	private func registerDefaultTags() {
		registerTag("macro", parser: MacroNode.parse)
		registerTag("call", parser: CallNode.parse)
		registerTag("with", parser: WithNode.parse)
		registerTag("map", parser: MapNode.parse)
	}
	
	private func registerDefaultFilters() {
		registerFilter("splitNewlines", filter: SyrupStencilExtension.splitNewlines)
		registerFilter("camelCased", filter: SyrupStencilExtension.camelCased)
		registerFilter("lowercasedFirstLetter", filter: SyrupStencilExtension.lowercasedFirstLetter)
		registerFilter("replace", filter: SyrupStencilExtension.replace)
		registerFilter("replaceQuotes", filter: SyrupStencilExtension.replaceQuotes)
		registerFilter("replaceTypeScriptQuotes", filter: SyrupStencilExtension.replaceTypeScriptQuotes)
		registerFilter("capitalizeFirstLetter", filter: SyrupStencilExtension.capitalizeFirstLetter)
		registerFilter("pascalCase", filter: SyrupStencilExtension.pascalCase)
		registerFilter("encryptData", filter: SyrupStencilExtension.encryptData)
		registerFilter("renderClassName", filter: SyrupStencilExtension.renderClassName)
		registerFilter("renderPackage", filter: SyrupStencilExtension.renderPackage)
		registerFilter("renderOperationTypeName", filter: SyrupStencilExtension.renderOperationTypeName)
	}
	
	// MARK: - Custom Filters
	
	private static func splitNewlines(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.components(separatedBy: .newlines)
	}
	
	/// Converts snake_case to camelCase, stripping prefix underscores if needed
	///
	/// - Parameters:
	///   - string: the value to be processed
	///   - stripLeading: if false, will preserve leading underscores
	/// - Returns: the camel case string
	static func camelCased(_ value: Any?) throws -> Any? {
		guard let value = value as? String, !value.isEmpty else { return nil }
		return value.components(separatedBy: "_").map { $0.capitalized }.joined().lowercasedFirstLetter
	}
	
	static func lowercasedFirstLetter(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.lowercasedFirstLetter
	}
	
	static func replace(_ value: Any?, arguments: [Any?]) throws -> Any? {
		guard let value = value as? String,
			  let arguments = arguments as? [String],
			  arguments.count == 2,
			  let replaceInput = arguments.first,
			  let replaceOutput = arguments.last else {
			return nil
		}
		return value.replacingOccurrences(of: replaceInput, with: replaceOutput)
	}
	
	static func replaceQuotes(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.replacingOccurrences(of: "\"", with: "\\\\\\\"")
	}
	
	static func replaceTypeScriptQuotes(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.replacingOccurrences(of: "\"", with: "\\\"")
	}
	
	static func capitalizeFirstLetter(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.capitalized
	}
	
	static func renderPackage(_ value: Any?) throws -> Any? {
		guard let value = value as? IntermediateRepresentation.OperationDefinition else { return nil }
		switch value.type {
		case .query:
			return "queries"
		case .mutation:
			return "mutations"
		case .subscription:
			return "subscriptions"
		}
	}
	
	static func renderClassName(_ value: Any?) throws -> Any? {
		guard let value = value as? IntermediateRepresentation.OperationDefinition else { return nil }
		switch value.type {
		case .query:
			return "\(value.name)Query"
		case .mutation:
			return "\(value.name)Mutation"
		case .subscription:
			return "\(value.name)Subscription"
		}
	}
	
	static func renderOperationTypeName(_ value: Any?) throws -> Any? {
		guard let value = value as? IntermediateRepresentation.OperationDefinition else { return nil }
		return "\(value.type)".capitalized
	}
	
	static func encryptData(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.sha256Stringified()
	}
	
	static func pascalCase(_ value: Any?) throws -> Any? {
		guard let value = value as? String else { return nil }
		return value.convertToPascalCase()
	}
}
