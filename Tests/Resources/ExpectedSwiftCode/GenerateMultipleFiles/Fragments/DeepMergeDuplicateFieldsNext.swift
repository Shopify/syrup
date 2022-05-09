// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DeepMergeDuplicateFields: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Globally unique identifier.
		public var id: GraphID
		/// List of shipments for the order.
		public var fulfillments: [Fulfillments]

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(id: GraphID, fulfillments: [Fulfillments]) {
			self.id = id
			self.fulfillments = fulfillments
			self.__typename = "Order"
	}

		// MARK: - Nested Types
			public struct Fulfillments: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// List of the fulfillment's line items.
			public var fulfillmentLineItems: FulfillmentLineItems
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(fulfillmentLineItems: FulfillmentLineItems) {
				self.fulfillmentLineItems = fulfillmentLineItems
				self.__typename = "Fulfillment"
		}
			// MARK: - Nested Types
				public struct FulfillmentLineItems: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// A list of edges.
				public var edges: [Edges]
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(edges: [Edges]) {
					self.edges = edges
					self.__typename = "FulfillmentLineItemConnection"
			}
				// MARK: - Nested Types
					public struct Edges: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// The item at the end of FulfillmentLineItemEdge.
					public var node: Node
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(node: Node) {
						self.node = node
						self.__typename = "FulfillmentLineItemEdge"
				}
					// MARK: - Nested Types
						public struct Node: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						/// The associated order's line item.
						public var lineItem: LineItem
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
					public init(lineItem: LineItem) {
							self.lineItem = lineItem
							self.__typename = "FulfillmentLineItem"
					}
						// MARK: - Nested Types
							public struct LineItem: GraphApiResponse, Equatable {
						// MARK: - Response Fields
							/// Globally unique identifier.
							public var id: GraphID
						// MARK: - Helpers
						public let __typename: String
						public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
						public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
						public init(id: GraphID) {
								self.id = id
								self.__typename = "LineItem"
						}
					}
				}
			}
		}
	}
}
}


extension MerchantApi.DeepMergeDuplicateFields {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "DeepMergeDuplicateFields",
    typeCondition: .object("Order"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .scalar("ID"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "fulfillments", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .object("Fulfillment"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Fulfillment"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "fulfillmentLineItems", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(250)
)
  ]
, parentType: .object("Fulfillment"), type: .object("FulfillmentLineItemConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemConnection"), type: .object("FulfillmentLineItemEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemEdge"), type: .object("FulfillmentLineItem"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "lineItem", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItem"), type: .object("LineItem"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("LineItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("LineItem"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "fulfillments", alias: nil
, arguments: 
  []
, parentType: .object("Order"), type: .object("Fulfillment"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Fulfillment"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "fulfillmentLineItems", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(250)
)
  ]
, parentType: .object("Fulfillment"), type: .object("FulfillmentLineItemConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemConnection"), type: .object("FulfillmentLineItemEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItemEdge"), type: .object("FulfillmentLineItem"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "lineItem", alias: nil
, arguments: 
  []
, parentType: .object("FulfillmentLineItem"), type: .object("LineItem"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("LineItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("LineItem"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
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
