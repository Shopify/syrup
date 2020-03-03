// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct CustomScalarResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a Customer resource by ID.
		public var customer: Customer?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(customer: Customer?) {
			self.customer = customer
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Customer: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The number of orders that the customer has made at the store in their lifetime.
			public var ordersCount: UInt64
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case ordersCount
			}
			public init(from decoder: Decoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.ordersCount = try customScalarResolver.decode(UInt64.self, rawValueType: String.self, forKey: .ordersCount, container: container) { (value) -> UInt64 in
	return try customScalarResolver.decoderForUnsignedInt64(value, container.codingPath)
	}
			}
			public func encode(to encoder: Encoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				var container = encoder.container(keyedBy: CodingKeys.self)
				try container.encode(__typename, forKey: .__typename)
			try customScalarResolver.encode(ordersCount, rawValueType: String.self, forKey: .ordersCount, container: &container) { [codingPath = container.codingPath] (value) -> String in
				return try customScalarResolver.encoderForUnsignedInt64(value, codingPath)
			}
			}
		public init(ordersCount: UInt64) {
				self.ordersCount = ordersCount
				self.__typename = "Customer"
		}
	}
}
}
