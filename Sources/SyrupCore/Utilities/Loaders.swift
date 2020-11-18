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

#if canImport(FoundationNetworking)
import FoundationNetworking
#endif

func loadSchema(location: String) throws -> Schema {
	let url = URL(string: location)!
	let schemaData: Data
	if url.scheme == nil && url.host == nil {
		print("Loading schema: \u{001B}[96m./\(location)\u{001B}[0m")
		schemaData = try Data(contentsOf: URL(fileURLWithPath: location))
	} else {
		print("Downloading latest schema...")
		let semaphore = DispatchSemaphore(value: 0)
		let session = URLSession.shared
		var taskResult: (data: Data?, response: URLResponse?, error: Error?)! = nil
		let task = session.dataTask(with: url) { (data, response, error) in
			taskResult = (data, response, error)
			semaphore.signal()
		}
		task.resume()
		semaphore.wait()

		guard let response = taskResult.response as? HTTPURLResponse else {
			throw NSError(domain: NSURLErrorDomain, code: NSURLErrorBadServerResponse, userInfo: [NSLocalizedDescriptionKey: "Request did not return HTTPURLResponse"])
		}
		if response.statusCode != 200 {
			throw NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch schema, got error \(response.statusCode)"])
		}
		if let data = taskResult.data {
			schemaData = data
		} else if let error = taskResult.error {
			throw error
		} else {
			throw NSError(domain: NSURLErrorDomain, code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch schema"])
		}
	}

	return try JSONDecoder().decode(Schema.self, from: schemaData)
}
