// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct SimpleDuplicateFieldResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a Shop resource corresponding to access token used in request.
		public var shop: Shop

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(shop: Shop) {
			self.shop = shop
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Shop: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The shop's features.
			public var features: Features
			/// The shop's name.
			public var name: String
			/// Globally unique identifier.
			public var id: GraphID
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(features: Features, name: String, id: GraphID) {
				self.features = features
				self.name = name
				self.id = id
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
				/// Whether the shop has an online storefront.
				public var storefront: Bool
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(shopifyPlus: Bool, storefront: Bool) {
					self.shopifyPlus = shopifyPlus
					self.storefront = storefront
					self.__typename = "ShopFeatures"
			}
		}
	}
}
}
