// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Union3Response: GraphApiResponse, Equatable {
	// MARK: - Response Fields

		/// Lookup a price rule by ID.
		public var priceRule: MerchantApi.UnionFrag2.PriceRule? {
			get {
				return asUnionFrag2Fragment.priceRule
			}
			set {
				asUnionFrag2Fragment.priceRule = newValue
			}
		}

		public var asUnionFrag2Fragment: MerchantApi.UnionFrag2

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: String, CodingKey {
			case __typename
				case asUnionFrag2Fragment = "fragment:asUnionFrag2Fragment"
		}

		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				do {
					self.asUnionFrag2Fragment = try MerchantApi.UnionFrag2(from: decoder)
				} catch let originalError {
					do {
						self.asUnionFrag2Fragment = try container.decode(MerchantApi.UnionFrag2.self, forKey: .asUnionFrag2Fragment)
					} catch {
							throw originalError
					}
				}
		}

	public init(unionFrag2Fragment: MerchantApi.UnionFrag2) {
			self.asUnionFrag2Fragment = unionFrag2Fragment
			self.__typename = "QueryRoot"
	}

}
}
