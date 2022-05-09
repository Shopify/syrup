// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct FragmentDuplicatedFieldResponse: GraphApiResponse, Equatable {
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
			/// The shop's name.
			public var name: String
			/// Globally unique identifier.
			public var id: GraphID
			/// The shop's features.
			public var features: Features
			public var asFeaturesFragment: MerchantApi.Features
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case name
					case id
					case features
					case asFeaturesFragment = "fragment:asFeaturesFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.name = try container.decode(String.self, forKey: .name)
					self.id = try container.decode(GraphID.self, forKey: .id)
					self.features = try container.decode(Features.self, forKey: .features)
					do {
						self.asFeaturesFragment = try MerchantApi.Features(from: decoder)
					} catch let originalError {
						do {
							self.asFeaturesFragment = try container.decode(MerchantApi.Features.self, forKey: .asFeaturesFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(name: String, id: GraphID, features: Features, featuresFragment: MerchantApi.Features) {
				self.name = name
				self.id = id
				self.features = features
				self.asFeaturesFragment = featuresFragment
				self.__typename = "Shop"
		}
			// MARK: - Nested Types
				public struct Features: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// Whether the shop has an online storefront.
				public var storefront: Bool
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(storefront: Bool) {
					self.storefront = storefront
					self.__typename = "ShopFeatures"
			}
		}
	}
}
}
