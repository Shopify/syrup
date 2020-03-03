// Syrup auto-generated file
import Foundation

public extension StarWarsAPI {
	struct FilmsQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let first: Int32

		// MARK: - Initializer
		public init(first: Int32) {
				self.first = first
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = StarWarsAPI.customEncoder

		private enum CodingKeys: CodingKey {
				case first
		}

		public typealias Response = FilmsResponse

		public let queryString: String = """
		query Films($first: Int!) { __typename allFilms(first: $first) { __typename edges { __typename node { __typename id title director openingCrawl } } } }
		"""
	}
}


extension StarWarsAPI.FilmsQuery {
  public static let operationSelections: GraphSelections.Operation? = nil
}
