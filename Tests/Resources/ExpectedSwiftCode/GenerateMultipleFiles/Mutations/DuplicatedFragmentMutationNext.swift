// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct DuplicatedFragmentMutation: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let orderInput: OrderInput
			public let customerInput: CustomerInput

		// MARK: - Initializer
		public init(orderInput: OrderInput, customerInput: CustomerInput) {
				self.orderInput = orderInput
				self.customerInput = customerInput
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
				case orderInput
				case customerInput
		}

		public typealias Response = DuplicatedFragmentResponse

		public let queryString: String = """
		fragment UserErrors on UserError { __typename field message } mutation DuplicatedFragment($orderInput: OrderInput!, $customerInput: CustomerInput!) { __typename orderUpdate(input: $orderInput) { __typename userErrors { __typename ... UserErrors } } customerUpdate(input: $customerInput) { __typename userErrors { __typename ... UserErrors } } }
		"""
	}
}


extension MerchantApi.DuplicatedFragmentMutation {
  public static let operationSelections: GraphSelections.Operation? = GraphSelections.Operation(
    type: .mutation("Mutation"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Mutation"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "orderUpdate", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "input", value: 
    .variable("orderInput")
)
  ]
, parentType: .object("Mutation"), type: .object("OrderUpdatePayload"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("OrderUpdatePayload"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "userErrors", alias: nil
, arguments: 
  []
, parentType: .object("OrderUpdatePayload"), type: .object("UserError"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("UserError"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.UserErrors.fragmentSpread
)
  ]
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "customerUpdate", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "input", value: 
    .variable("customerInput")
)
  ]
, parentType: .object("Mutation"), type: .object("CustomerUpdatePayload"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerUpdatePayload"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "userErrors", alias: nil
, arguments: 
  []
, parentType: .object("CustomerUpdatePayload"), type: .object("UserError"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("UserError"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.UserErrors.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
