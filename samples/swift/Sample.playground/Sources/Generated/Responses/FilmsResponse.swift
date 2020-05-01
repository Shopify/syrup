// Syrup auto-generated file
import Foundation

public extension StarWarsAPI {
struct FilmsResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		public var allFilms: AllFilms?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = StarWarsAPI.customDecoder
	public static let customEncoder: JSONEncoder = StarWarsAPI.customEncoder

	public init(allFilms: AllFilms?) {
			self.allFilms = allFilms
			self.__typename = "Root"
	}

		// MARK: - Nested Types
			public struct AllFilms: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// A list of edges.
			public var edges: [Edges?]?
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = StarWarsAPI.customDecoder
		public static let customEncoder: JSONEncoder = StarWarsAPI.customEncoder
		public init(edges: [Edges?]?) {
				self.edges = edges
				self.__typename = "FilmsConnection"
		}
			// MARK: - Nested Types
				public struct Edges: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// The item at the end of the edge
				public var node: Node?
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = StarWarsAPI.customDecoder
			public static let customEncoder: JSONEncoder = StarWarsAPI.customEncoder
			public init(node: Node?) {
					self.node = node
					self.__typename = "FilmsEdge"
			}
				// MARK: - Nested Types
					public struct Node: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// The ID of an object
					public var id: GraphID
					/// The title of this film.
					public var title: String?
					/// The name of the director of this film.
					public var director: String?
					/// The opening paragraphs at the beginning of this film.
					public var openingCrawl: String?
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = StarWarsAPI.customDecoder
				public static let customEncoder: JSONEncoder = StarWarsAPI.customEncoder
				public init(id: GraphID, title: String?, director: String?, openingCrawl: String?) {
						self.id = id
						self.title = title
						self.director = director
						self.openingCrawl = openingCrawl
						self.__typename = "Film"
				}
			}
		}
	}
}
}
