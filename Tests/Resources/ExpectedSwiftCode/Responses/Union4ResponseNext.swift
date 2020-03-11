// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Union4Response: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Lookup a price rule by ID.
		public var priceRule: PriceRule?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(priceRule: PriceRule?) {
			self.priceRule = priceRule
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			@dynamicMemberLookup
	public struct PriceRule: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.UnionFrag4, T>) -> T {
				get { asUnionFrag4Fragment[keyPath: keyPath] }
				set { asUnionFrag4Fragment[keyPath: keyPath] = newValue }
			}
			public var asUnionFrag4Fragment: MerchantApi.UnionFrag4
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case asUnionFrag4Fragment = "fragment:asUnionFrag4Fragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					do {
						self.asUnionFrag4Fragment = try MerchantApi.UnionFrag4(from: decoder)
					} catch let originalError {
						do {
							self.asUnionFrag4Fragment = try container.decode(MerchantApi.UnionFrag4.self, forKey: .asUnionFrag4Fragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(unionFrag4Fragment: MerchantApi.UnionFrag4) {
				self.asUnionFrag4Fragment = unionFrag4Fragment
				self.__typename = "PriceRule"
		}
	}
}
}
