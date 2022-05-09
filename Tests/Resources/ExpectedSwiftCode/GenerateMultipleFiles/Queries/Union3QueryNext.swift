// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct Union3Query: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = Union3Response

		public let queryString: String = """
		fragment UnionFrag2 on QueryRoot { __typename priceRule(id: "") { __typename value { __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } } } query Union3 { __typename ... UnionFrag2 }
		"""
	}
}


extension MerchantApi.Union3Query {
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
  .fragmentSpread(MerchantApi.UnionFrag2.fragmentSpread
)
  ]
  )
}
