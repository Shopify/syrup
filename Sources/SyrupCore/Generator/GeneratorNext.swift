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

public final class GeneratorNext {
	let config: Config
	
	public init(config: Config) {
		self.config = config
	}
	
	public func generate() throws {
		let schema = try loadSchema(location: config.schema.location)
		
	}
	
	private func generateModels(filesLocation: String, schema: Schema) {
		// Get raw operations from folder location
		let rawOperations = try FileParser.parseFiles(at: filesLocation)
		
		// Validate GraphQL syntax
		try validateOperations(operations: rawOperations)
	}
	
	private static func parseOperations(rawOperations: [String: String]) throws -> (
		queries: [String: String],
		mutations: [String: String],
		subscriptions: [String: String],
		fragments: [String: String]
	) {
		print("Parsing .graphql files")
		let visitor = OperationVisitor()
		let document = try parse(graphQLString)
		let traverser = GraphQLTraverser(document: document, with: visitor)
		try traverser.traverse()
		return (visitor.queries, visitor.mutations, visitor.subscriptions, visitor.fragments)
	}
}
