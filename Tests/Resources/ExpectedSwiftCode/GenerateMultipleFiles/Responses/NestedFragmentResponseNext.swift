// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct NestedFragmentResponse: GraphApiResponse, Equatable {
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
			/// Globally unique identifier.
			public var id: GraphID {
				get {
					return asNestedFragmentSpreadFragment.id
				}
				set {
					asNestedFragmentSpreadFragment.id = newValue
				}
			}
			public var asNestedFragmentSpreadFragment: MerchantApi.NestedFragmentSpread
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case asNestedFragmentSpreadFragment = "fragment:asNestedFragmentSpreadFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					do {
						self.asNestedFragmentSpreadFragment = try MerchantApi.NestedFragmentSpread(from: decoder)
					} catch let originalError {
						do {
							self.asNestedFragmentSpreadFragment = try container.decode(MerchantApi.NestedFragmentSpread.self, forKey: .asNestedFragmentSpreadFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(nestedFragmentSpreadFragment: MerchantApi.NestedFragmentSpread) {
				self.asNestedFragmentSpreadFragment = nestedFragmentSpreadFragment
				self.__typename = "Shop"
		}
	}
}
}
