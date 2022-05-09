// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct Union4Query: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = Union4Response

		public let queryString: String = """
		fragment UnionFrag4 on PriceRule { __typename value { __typename ... on PriceRulePercentValue { __typename percentage } } } query Union4 { __typename priceRule(id: "") { __typename ... UnionFrag4 } }
		"""
	}
}


extension MerchantApi.Union4Query {
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
  .fragmentSpread(MerchantApi.UnionFrag4.fragmentSpread
)
  ]
  ))
  ]
  )
}
