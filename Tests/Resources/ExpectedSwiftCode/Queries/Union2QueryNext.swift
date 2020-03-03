// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct Union2Query: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = Union2Response

		public let queryString: String = """
		fragment UnionFrag on PriceRuleValue { __typename __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } query Union2 { __typename priceRule(id: "") { __typename value { __typename ... UnionFrag } } }
		"""
	}
}


extension MerchantApi.Union2Query {
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
  .field(GraphSelections.Field(name: "priceRule", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("")
)
  ]
, parentType: .object("QueryRoot"), type: .object("PriceRule"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PriceRule"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "value", alias: nil
, arguments: 
  []
, parentType: .object("PriceRule"), type: .union("PriceRuleValue"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("PriceRuleValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.UnionFrag.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
