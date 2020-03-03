// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct ConditionalDirectivesResponse: GraphApiResponse, Equatable {
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
			/// The shop's primary domain name.
			public var primaryDomain: PrimaryDomain?
			/// The shop's features.
			public var features: MerchantApi.ConditionalDirectivesFrag1.Features {
				get {
					return asConditionalDirectivesFrag1Fragment.features
				}
				set {
					asConditionalDirectivesFrag1Fragment.features = newValue
				}
			}
			public var asConditionalDirectivesFrag1Fragment: MerchantApi.ConditionalDirectivesFrag1
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case primaryDomain
					case asConditionalDirectivesFrag1Fragment = "fragment:asConditionalDirectivesFrag1Fragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.primaryDomain = try container.decodeIfPresent(PrimaryDomain.self, forKey: .primaryDomain)
					do {
						self.asConditionalDirectivesFrag1Fragment = try MerchantApi.ConditionalDirectivesFrag1(from: decoder)
					} catch let originalError {
						do {
							self.asConditionalDirectivesFrag1Fragment = try container.decode(MerchantApi.ConditionalDirectivesFrag1.self, forKey: .asConditionalDirectivesFrag1Fragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(primaryDomain: PrimaryDomain?, conditionalDirectivesFrag1Fragment: MerchantApi.ConditionalDirectivesFrag1) {
				self.primaryDomain = primaryDomain
				self.asConditionalDirectivesFrag1Fragment = conditionalDirectivesFrag1Fragment
				self.__typename = "Shop"
		}
			// MARK: - Nested Types
				public struct PrimaryDomain: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// The URL of the domain (eg: `https://example.com`).
				public var url: URL
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(url: URL) {
					self.url = url
					self.__typename = "Domain"
			}
		}
	}
}
}
