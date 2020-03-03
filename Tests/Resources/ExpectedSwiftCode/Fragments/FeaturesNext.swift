// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Features: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The shop's features.
		public var features: Features

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(features: Features) {
			self.features = features
			self.__typename = "Shop"
	}

		// MARK: - Nested Types
			public struct Features: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Whether the shop has a Shopify Plus subscription.
			/// - Warning:
			/// Use Shop.plan.shopifyPlus instead.
	@available(*, deprecated, message: "")
			public var shopifyPlus: Bool
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(shopifyPlus: Bool) {
				self.shopifyPlus = shopifyPlus
				self.__typename = "ShopFeatures"
		}
	}
}
}


extension MerchantApi.Features {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "Features",
    typeCondition: .object("Shop"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "features", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .object("ShopFeatures"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ShopFeatures"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "shopifyPlus", alias: nil
, arguments: 
  []
, parentType: .object("ShopFeatures"), type: .scalar("Boolean"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
