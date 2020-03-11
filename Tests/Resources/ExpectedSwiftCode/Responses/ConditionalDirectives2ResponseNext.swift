// Syrup auto-generated file
import Foundation

public extension MerchantApi {
@dynamicMemberLookup

struct ConditionalDirectives2Response: GraphApiResponse, Equatable {
	// MARK: - Response Fields

		public subscript<T>(dynamicMember keyPath: KeyPath<MerchantApi.ConditionalDirectivesFrag2?, T>) -> T? {
			asConditionalDirectivesFrag2Fragment?[keyPath: keyPath]
		}

		public var asConditionalDirectivesFrag2Fragment: MerchantApi.ConditionalDirectivesFrag2?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: String, CodingKey {
			case __typename
				case asConditionalDirectivesFrag2Fragment = "fragment:asConditionalDirectivesFrag2Fragment"
		}

		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				do {
					self.asConditionalDirectivesFrag2Fragment = try MerchantApi.ConditionalDirectivesFrag2(from: decoder)
				} catch  {
					do {
						self.asConditionalDirectivesFrag2Fragment = try container.decode(MerchantApi.ConditionalDirectivesFrag2?.self, forKey: .asConditionalDirectivesFrag2Fragment)
					} catch {
							self.asConditionalDirectivesFrag2Fragment = nil
					}
				}
		}

	public init(conditionalDirectivesFrag2Fragment: MerchantApi.ConditionalDirectivesFrag2?) {
			self.asConditionalDirectivesFrag2Fragment = conditionalDirectivesFrag2Fragment
			self.__typename = "QueryRoot"
	}

}
}
