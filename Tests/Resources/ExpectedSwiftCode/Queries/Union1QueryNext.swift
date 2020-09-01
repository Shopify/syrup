// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct Union1Query: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = Union1Response

		public let queryString: String = """
		query Union1 { __typename priceRule(id: "") { __typename id value { __typename ... on PriceRulePercentValue { __typename percentage }... on PriceRuleFixedAmountValue { __typename amount } } } }
		"""
	}
}


extension MerchantApi.Union1Query {
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
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("PriceRule"), type: .scalar("ID"), selectionSet: 
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
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("PriceRulePercentValue")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PriceRulePercentValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "percentage", alias: nil
, arguments: 
  []
, parentType: .object("PriceRulePercentValue"), type: .scalar("Float"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("PriceRuleFixedAmountValue")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PriceRuleFixedAmountValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "amount", alias: nil
, arguments: 
  []
, parentType: .object("PriceRuleFixedAmountValue"), type: .scalar("Money"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
