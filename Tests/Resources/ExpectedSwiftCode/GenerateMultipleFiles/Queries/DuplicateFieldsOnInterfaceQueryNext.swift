// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct DuplicateFieldsOnInterfaceQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = DuplicateFieldsOnInterfaceResponse

		public let queryString: String = """
		fragment DuplicateFieldsOnInterface on AppPurchase { __typename createdAt price { __typename amount currencyCode } ... on AppPurchaseOneTime { __typename createdAt price { __typename amount currencyCode } returnUrl } } query DuplicateFieldsOnInterface { __typename node(id: "") { __typename ... on AppPurchase { __typename ... DuplicateFieldsOnInterface } } }
		"""
	}
}


extension MerchantApi.DuplicateFieldsOnInterfaceQuery {
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
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("")
)
  ]
, parentType: .object("QueryRoot"), type: .interface("Node"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Node"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .interface("AppPurchase")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("AppPurchase"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.DuplicateFieldsOnInterface.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
