/*
 * The MIT License (MIT)
 *
 * Copyright (c) 2019 SwiftGen
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

import Stencil

struct CallableBlock {
	let parameters: [String]
	let nodes: [NodeType]
	
	init(parameters: [String], nodes: [NodeType], token: Token? = nil) {
		self.parameters = parameters
		self.nodes = nodes
	}
	
	func context(_ context: Context, arguments: [Resolvable], variable: Variable) throws -> [String: Any] {
		guard parameters.count == arguments.count else {
			throw TemplateSyntaxError(
				"""
				Block '\(variable.variable)' accepts \(parameters.count) parameters, \
				\(arguments.count) given.
				"""
			)
		}
		
		var result = [String: Any]()
		for (parameter, argument) in zip(parameters, arguments) {
			result[parameter] = try argument.resolve(context)
		}
		
		return result
	}
}

class MacroNode: NodeType {
	let variableName: String
	let parameters: [String]
	let nodes: [NodeType]
	let token: Token?
	
	class func parse(_ parser: TokenParser, token: Token) throws -> NodeType {
		let components = token.components()
		guard components.count >= 2 else {
			throw TemplateSyntaxError("'macro' tag takes at least one argument, the name of the variable to set.")
		}
		let variable = components[1]
		let parameters = Array(components.dropFirst(2))
		
		let setNodes = try parser.parse(until(["endmacro"]))
		guard parser.nextToken() != nil else {
			throw TemplateSyntaxError("`endmacro` was not found.")
		}
		
		return MacroNode(variableName: variable, parameters: parameters, nodes: setNodes, token: token)
	}
	
	init(variableName: String, parameters: [String], nodes: [NodeType], token: Token? = nil) {
		self.variableName = variableName
		self.parameters = parameters
		self.nodes = nodes
		self.token = token
	}
	
	func render(_ context: Context) throws -> String {
		let result = CallableBlock(parameters: parameters, nodes: nodes, token: token)
		context[variableName] = result
		return ""
	}
}

class CallNode: NodeType {
	let variable: Variable
	let arguments: [Resolvable]
	let token: Token?
	
	class func parse(_ parser: TokenParser, token: Token) throws -> NodeType {
		let components = token.components()
		guard components.count >= 2 else {
			throw TemplateSyntaxError("'call' tag takes at least one argument, the name of the block to call.")
		}
		
		let variable = Variable(components[1])
		let arguments = try Array(components.dropFirst(2)).map {
			try parser.compileResolvable($0, containedIn: token)
		}
		
		return CallNode(variable: variable, arguments: arguments, token: token)
	}
	
	init(variable: Variable, arguments: [Resolvable], token: Token? = nil) {
		self.variable = variable
		self.arguments = arguments
		self.token = token
	}
	
	func render(_ context: Context) throws -> String {
		guard let block = try variable.resolve(context) as? CallableBlock else {
			throw TemplateSyntaxError("Call to undefined block '\(variable.variable)'.")
		}
		let blockContext = try block.context(context, arguments: arguments, variable: variable)
		
		let retVal = try context.push(dictionary: blockContext) {
			try renderNodes(block.nodes, context)
		}
		return retVal
	}
}
