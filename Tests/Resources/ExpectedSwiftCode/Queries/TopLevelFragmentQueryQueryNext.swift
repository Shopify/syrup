// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct TopLevelFragmentQueryQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = TopLevelFragmentQueryResponse

		public let queryString: String = """
		fragment TopLevelFragment on QueryRoot { __typename node(id: "") { __typename ... on Product { __typename id } } } query TopLevelFragmentQuery { __typename ... TopLevelFragment }
		"""
	}
}


extension MerchantApi.TopLevelFragmentQueryQuery {
  public static let operationSelections: GraphSelections.Operation? = GraphSelections.Operation(
    type: .query("QueryRoot"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("QueryRoot"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.TopLevelFragment.fragmentSpread
)
  ]
  )
}
