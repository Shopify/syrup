// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultipleDuplicatedFragmentsResponse: GraphApiResponse, Equatable {
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
			public var name: String {
				get {
					return asDuplicatedFragmentFragment.name
				}
				set {
					asDuplicatedFragmentFragment.name = newValue
				}
			}
			public var asDuplicatedFragmentFragment: MerchantApi.DuplicatedFragment
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case asDuplicatedFragmentFragment = "fragment:asDuplicatedFragmentFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					do {
						self.asDuplicatedFragmentFragment = try MerchantApi.DuplicatedFragment(from: decoder)
					} catch let originalError {
						do {
							self.asDuplicatedFragmentFragment = try container.decode(MerchantApi.DuplicatedFragment.self, forKey: .asDuplicatedFragmentFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(duplicatedFragmentFragment: MerchantApi.DuplicatedFragment) {
				self.asDuplicatedFragmentFragment = duplicatedFragmentFragment
				self.__typename = "Shop"
		}
	}
}
}
