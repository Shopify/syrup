import Foundation

// These need to be set manually, to allow for custom configuration of the logger and decoder/encoder behaviour.
// Your generated code will not compile withou this.
extension GraphApiQuery {
	public static var errorLogger: GraphApiLogger? {
		nil
	}
}

extension GraphApiResponse {
	public static var errorLogger: GraphApiLogger? {
		nil
	}
}

extension StarWarsAPI {
	public static var customDecoder: JSONDecoder {
		JSONDecoder.init()
	}
	
	public static var customEncoder: JSONEncoder {
		JSONEncoder.init()
	}
}

public class GraphQLClient {
	let session: URLSession
	let endpoint: URL
	
	public init(endpoint: URL) {
		self.endpoint = endpoint
		let configuration = URLSessionConfiguration.default
		configuration.httpAdditionalHeaders = ["Content-Type": "application/json", "Accept": "application/json"]
		self.session = URLSession(configuration: configuration)
	}
	
	public func query<Q: GraphApiQuery, R: GraphApiResponse>(_ query: Q, responseType: R.Type, completionHandler: @escaping (R?, Error?) -> Void) -> URLSessionTask {
		var request = URLRequest(url: endpoint)
		request.httpBody = try! RequestBody<Q>.requestBody(for: query)
		request.httpMethod = "POST"
		let task = session.dataTask(with: request) { (data, response, error) in
			if let data = data {
				let decodedResponse = try! R.customDecoder.decode(RequestResponse<R>.self, from: data)
				completionHandler(decodedResponse.data, nil)
			} else {
				completionHandler(nil, error)
			}
		}
		task.resume()
		return task
	}
}

private struct RequestBody<Q: GraphApiQuery>: Encodable {
		private let query: String
		private let variables: Q
		
		init(query: Q) {
			self.query = query.queryString
			self.variables = query
		}
	
	static func requestBody<Q: GraphApiQuery>(for query: Q) throws -> Data {
		return try Q.customEncoder.encode(RequestBody<Q>(query: query))
	}
}

private struct RequestResponse<R: GraphApiResponse>: Decodable {
	let data: R
}

