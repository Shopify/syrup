// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultiLevelFragment: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The customer's last order.
		public var lastOrder: LastOrder?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(lastOrder: LastOrder?) {
			self.lastOrder = lastOrder
			self.__typename = "Customer"
	}

		// MARK: - Nested Types
			public struct LastOrder: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Description of the customer's experience with the store leading up to the order.
			public var customerJourney: CustomerJourney?
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(customerJourney: CustomerJourney?) {
				self.customerJourney = customerJourney
				self.__typename = "Order"
		}
			// MARK: - Nested Types
				public struct CustomerJourney: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// The customer's first session going into the shop.
				public var firstVisit: FirstVisit
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(firstVisit: FirstVisit) {
					self.firstVisit = firstVisit
					self.__typename = "CustomerJourney"
			}
				// MARK: - Nested Types
					public struct FirstVisit: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// Globally unique identifier.
					public var id: GraphID
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(id: GraphID) {
						self.id = id
						self.__typename = "CustomerVisit"
				}
			}
		}
	}
}
}


extension MerchantApi.MultiLevelFragment {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "MultiLevelFragment",
    typeCondition: .object("Customer"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "lastOrder", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .object("Order"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "customerJourney", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .object("CustomerJourney"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerJourney"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "firstVisit", alias: nil
, arguments: 
  []
, parentType: .object("CustomerJourney"), type: .object("CustomerVisit"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerVisit"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("CustomerVisit"), type: .scalar("ID"), selectionSet: 
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
