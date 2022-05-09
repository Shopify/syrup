// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct DeepMergeDuplicateFieldsQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let orderId: GraphID

		// MARK: - Initializer
		public init(orderId: GraphID) {
				self.orderId = orderId
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
				case orderId
		}

		public typealias Response = DeepMergeDuplicateFieldsResponse

		public let queryString: String = """
		fragment DeepMergeDuplicateFields on Order { __typename id fulfillments { __typename fulfillmentLineItems(first: 250) { __typename edges { __typename node { __typename lineItem { __typename id } } } } } fulfillments { __typename fulfillmentLineItems(first: 250) { __typename edges { __typename node { __typename lineItem { __typename id } } } } } } query DeepMergeDuplicateFields($orderId: ID!) { __typename order(id: $orderId) { __typename ... DeepMergeDuplicateFields } }
		"""
	}
}


extension MerchantApi.DeepMergeDuplicateFieldsQuery {
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
  .field(GraphSelections.Field(name: "order", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
    .variable("orderId")
)
  ]
, parentType: .object("QueryRoot"), type: .object("Order"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.DeepMergeDuplicateFields.fragmentSpread
)
  ]
  ))
  ]
  )
}
