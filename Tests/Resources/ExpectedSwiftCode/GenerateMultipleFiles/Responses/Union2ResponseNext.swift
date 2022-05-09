// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Union2Response: GraphApiResponse, Equatable {
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
			public struct PriceRule: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The value of the price rule.
			/// - Warning:
			/// Use `valueV2` instead
	@available(*, deprecated, message: "")
			public var value: Value
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(value: Value) {
				self.value = value
				self.__typename = "PriceRule"
		}
			// MARK: - Nested Types
	public struct Value: GraphApiResponse, Equatable {
		public var realized: Realized
		public var __typename: String
			public var asUnionFragFragment: MerchantApi.UnionFrag
		public enum Realized: Equatable {
			case unknown
		}
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		private enum CodingKeys: String, CodingKey {
			case __typename = "__typename"
				case asUnionFragFragment = "fragment:asUnionFragFragment"
		}
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
			switch __typename {
			default:
				self.realized = .unknown
			}
				do {
					self.asUnionFragFragment = try MerchantApi.UnionFrag(from: decoder)
				} catch {
					self.asUnionFragFragment = try container.decode(MerchantApi.UnionFrag.self, forKey: .asUnionFragFragment)
				}
		}
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(__typename, forKey: .__typename)
			switch realized {
			case .unknown:
				break
			}
				try container.encode(asUnionFragFragment, forKey: .asUnionFragFragment)
		}
		public init(__typename: String, realized: Realized, unionFragFragment: MerchantApi.UnionFrag) {
			self.__typename = __typename
			self.realized = realized
				self.asUnionFragFragment = unionFragFragment
		}
	}
	}
}
}
