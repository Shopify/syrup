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
import SwiftGraphQLParser

final class OperationVisitor: GraphQLBaseVisitor {
	struct Error: LocalizedError {
		let description: String
		
		var errorDescription: String? {
			description
		}
	}
	public var queries: [String: String] = [:]
	public var mutations: [String: String] = [:]
	public var fragments: [String: String] = [:]
	public var subscriptions: [String: String] = [:]
	
	private var currentOperationName: String = ""
	private var currentOperationType: OperationType = .query
	private enum OperationType: String {
		case query, mutation, fragment, subscription
		
		init?(rawValue: String) {
			switch rawValue {
			case OperationType.query.rawValue:
				self = .query
			case OperationType.mutation.rawValue:
				self = .mutation
			case OperationType.fragment.rawValue:
				self = .fragment
			case OperationType.subscription.rawValue:
				self = .subscription
			default:
				return nil
			}
		}
	}
	private var currentOperationContents: String = ""
	
	// Variable Definitions
	private var variableDefinitionsSize: Int = 0
	private var variableCount: Int = 0
	
	// Field Arguments
	private var argumentsSize: Int = 0
	private var argumentsCount: Int = 0
	
	// Value Parsing
	private var valueContext = Stack<ValueContext>()
	private enum ValueContext {
		case list
		case object
		case objectField
		case variableDefinition
	}
	
	// List Value
	private var listSize: Int = 0
	private var listCount: Int = 0
	
	// Object Value
	private var objectFieldsSize: Int = 0
	private var objectFieldCount: Int = 0
	
	override func visitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) throws {
		self.currentOperationType = .fragment
		self.currentOperationName = fragmentDefinition.fragmentName
		self.currentOperationContents = "\(currentOperationType.rawValue) \(currentOperationName) on "
		guard fragments[fragmentDefinition.fragmentName] == nil else {
			throw Error(description: "Duplicate fragment definition with name \(fragmentDefinition.fragmentName)")
		}
	}
	
	override func exitFragmentDefinition(fragmentDefinition: SwiftGraphQLParser.FragmentDefinition) {
		fragments[currentOperationName] = currentOperationContents
	}
	
	override func visitOperation(operation: SwiftGraphQLParser.Operation) throws {
		guard let type = OperationType(rawValue: operation.operationType.rawValue) else {
			throw Error(description: "Encountered unknown operation type \(operation.operationType)")
		}
		guard let name = operation.name else {
			throw Error(description: "Missing operation name for \(type)")
		}
		switch type {
		case .query where queries[name] != nil, .mutation where mutations[name] != nil:
			throw Error(description: "Duplicate operation definition with name \(name)")
		default:
			break
		}
		self.variableDefinitionsSize = operation.variableDefinitions?.count ?? 0
		self.variableCount = 0
		self.currentOperationType = type
		self.currentOperationName = name
		self.currentOperationContents = "\(currentOperationType.rawValue) \(currentOperationName)"
	}
	
	override func exitOperationDefinition(operationDefinition: SwiftGraphQLParser.OperationDefinition) {
		switch currentOperationType {
		case .query:
			queries[currentOperationName] = currentOperationContents
		case .mutation:
			mutations[currentOperationName] = currentOperationContents
		case .fragment:
			fragments[currentOperationName] = currentOperationContents
		case .subscription:
			subscriptions[currentOperationName] = currentOperationContents
		}
	}
	
	override func visitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) {
		if variableCount == 0 {
			currentOperationContents += "("
		} else {
			currentOperationContents += ", "
		}
		variableCount += 1
		valueContext.push(.variableDefinition)
	}
	
	override func exitVariableDefinition(variableDefinition: SwiftGraphQLParser.VariableDefinition) {
		if variableCount == variableDefinitionsSize {
			currentOperationContents += ")"
		}
		valueContext.pop()
	}
	
	override func visitListType(listType: Type) {
		currentOperationContents += "["
	}
	
	override func exitListType(listType: Type) {
		currentOperationContents += "]"
	}
	
	override func exitNonNullType(nonNullType: Type) {
		currentOperationContents += "!"
	}
	
	override func visitNamedType(namedType: String) {
		currentOperationContents += namedType
	}
	
	override func visitSelectionSet(selectionSet: [SwiftGraphQLParser.Selection]) {
		currentOperationContents += " {\n"
	}
	
	override func exitSelectionSet(selectionSet: [SwiftGraphQLParser.Selection]) {
		currentOperationContents += "\n}"
	}
	
	override func visitField(field: SwiftGraphQLParser.Field) {
		if let alias = field.alias {
			currentOperationContents += "\(alias): "
		}
		currentOperationContents += field.name
		argumentsSize = field.arguments.count
		argumentsCount = 0
	}
	
	override func exitField(field: SwiftGraphQLParser.Field) {
		currentOperationContents += "\n"
	}
	
	override func visitFragmentSpread(fragmentSpread: SwiftGraphQLParser.FragmentSpread) {
		currentOperationContents += "... \(fragmentSpread.fragmentName)"
	}
	
	override func exitFragmentSpread(fragmentSpread: SwiftGraphQLParser.FragmentSpread) {
		currentOperationContents += "\n"
	}
	
	override func visitInlineFragment(inlineFragment: SwiftGraphQLParser.InlineFragment) {
		currentOperationContents += "... on "
	}
	
	override func visitDirective(directive: SwiftGraphQLParser.Directive) {
		currentOperationContents += " @\(directive.name)"
		argumentsSize = directive.arguments.count
		argumentsCount = 0
	}
	
	override func visitArgument(argument: SwiftGraphQLParser.Argument) {
		if argumentsCount == 0 {
			currentOperationContents += "("
		} else {
			currentOperationContents += ", "
		}
		argumentsCount += 1
		currentOperationContents += "\(argument.name): "
	}
	
	override func exitArgument(argument: SwiftGraphQLParser.Argument) {
		if argumentsCount == argumentsSize {
			currentOperationContents += ")"
		}
	}
	
	override func visitVariable(variable: SwiftGraphQLParser.Variable) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += "$\(variable.name)"
		currentOperationContents += valueSuffix()
	}
	
	override func visitIntValue(intValue: String) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += intValue
		currentOperationContents += valueSuffix()
	}
	
	override func visitFloatValue(floatValue: String) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += floatValue
		currentOperationContents += valueSuffix()
	}
	
	override func visitStringValue(stringValue: StringValue) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		switch stringValue {
		case .singleQuote(let val):
			currentOperationContents += "\"\(val)\""
		case .blockQuote(let val):
			currentOperationContents += "\"\"\"\(val)\"\"\""
		}
		currentOperationContents += valueSuffix()
	}
	
	override func visitBooleanValue(booleanValue: Bool) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += booleanValue ? "true" : "false"
		currentOperationContents += valueSuffix()
	}
	
	override func visitNullValue() {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += "null"
		currentOperationContents += valueSuffix()
	}
	
	override func visitEnumValue(enumValue: String) {
		currentOperationContents += valuePrefix()
		updateContextCounts()
		currentOperationContents += enumValue
		currentOperationContents += valueSuffix()
	}
	
	override func visitObjectField(objectField: SwiftGraphQLParser.ObjectField) {
		valueContext.push(.objectField)
		currentOperationContents += "\(objectField.name): "
	}
	
	override func exitObjectField(objectField: SwiftGraphQLParser.ObjectField) {
		valueContext.pop()
	}
	
	override func visitListValue(listValue: [SwiftGraphQLParser.Value]) {
		valueContext.push(.list)
		listSize = listValue.count
		listCount = 0
	}
	
	override func exitListValue(listValue: [SwiftGraphQLParser.Value]) {
		valueContext.pop()
	}
	
	override func visitObjectValue(objectValue: [SwiftGraphQLParser.ObjectField]) {
		valueContext.push(.object)
		objectFieldsSize = objectValue.count
		objectFieldCount = 0
	}
	
	override func exitObjectValue(objectValue: [SwiftGraphQLParser.ObjectField]) {
		valueContext.pop()
	}
	
	private func valuePrefix() -> String {
		guard !valueContext.isEmpty else { return "" }
		let context = valueContext.peek()
		switch context {
		case .list:
			if listCount == 0 {
				return "["
			} else {
				return ", "
			}
		case .object:
			if objectFieldCount == 0 {
				return "{"
			} else {
				return ", "
			}
		case .objectField, .variableDefinition:
			return ""
		}
	}
	
	private func valueSuffix() -> String {
		guard !valueContext.isEmpty else { return "" }
		let context = valueContext.peek()
		switch context {
		case .list:
			if listCount == listSize {
				return "]"
			}
		case .object:
			if objectFieldCount == objectFieldsSize {
				return "}"
			}
		case .variableDefinition:
			return ": "
		case .objectField:
			return ""
		}
		return ""
	}
	
	private func updateContextCounts() {
		guard !valueContext.isEmpty else { return }
		let context = valueContext.peek()
		switch context {
		case .list:
			listCount += 1
		case .object:
			objectFieldCount += 1
		case .objectField, .variableDefinition:
			return
		}
	}
}
