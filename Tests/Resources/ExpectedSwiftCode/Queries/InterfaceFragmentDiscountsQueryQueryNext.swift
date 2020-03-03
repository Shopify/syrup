// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct InterfaceFragmentDiscountsQueryQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = InterfaceFragmentDiscountsQueryResponse

		public let queryString: String = """
		fragment InterfaceFragment on DiscountCode { __typename __typename ... on DiscountCodeBasic { __typename createdAt shareableUrls { __typename title url } } } query InterfaceFragmentDiscountsQuery { __typename codeDiscountNodes(first: 1) { __typename edges { __typename node { __typename codeDiscount { __typename ... InterfaceFragment } } } } }
		"""
	}
}


extension MerchantApi.InterfaceFragmentDiscountsQueryQuery {
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
  .field(GraphSelections.Field(name: "codeDiscountNodes", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(1)
)
  ]
, parentType: .object("QueryRoot"), type: .object("DiscountCodeNodeConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNodeConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNodeConnection"), type: .object("DiscountCodeNodeEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNodeEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNodeEdge"), type: .object("DiscountCodeNode"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNode"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "codeDiscount", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeNode"), type: .union("DiscountCode"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("DiscountCode"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.InterfaceFragment.fragmentSpread
)
  ]
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
