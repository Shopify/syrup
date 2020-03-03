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

final class WithNode: NodeType {
	class func parse(_ parser: TokenParser, token: Token) throws -> NodeType {
		let components = token.components()
		
		guard components.count == 4 && components[2] == "as" else {
			throw TemplateSyntaxError("'\(components[0])' statements should use the following '\(components[0]) <variable> as <name>' `\(token.contents)`.")
		}
		
		let nodes = try parser.parse(until(["end\(components[0])"]))
		_ = parser.nextToken()
		return WithNode(name: components[3], variable: Variable(components[1]), nodes: nodes, token: token)
	}
	
	let name: String
	let variable: Variable
	let nodes: [NodeType]
	let token: Token?

	public init(name: String, variable: Variable, nodes: [NodeType], token: Token? = nil) {
		self.name = name
		self.variable = variable
		self.nodes = nodes
		self.token = token
	}
	
	func render(_ context: Context) throws -> String {
		guard let variableResult = try variable.resolve(context) else {
			throw TemplateSyntaxError("Variable \(variable.variable) couldn't be resolved.")
		}
		return try context.push(dictionary: [name: variableResult]) {
			return try renderNodes(nodes, context)
		}
	}
}
