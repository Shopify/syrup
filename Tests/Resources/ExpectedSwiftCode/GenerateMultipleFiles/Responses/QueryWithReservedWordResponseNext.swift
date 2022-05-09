// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct QueryWithReservedWordResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a Shop resource corresponding to access token used in request.
		public var `class`: Class

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(`class`: Class) {
			self.`class` = `class`
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Class: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Globally unique identifier.
			public var `return`: GraphID
			/// The shop's name.
			public var `func`: String
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(`return`: GraphID, `func`: String) {
				self.`return` = `return`
				self.`func` = `func`
				self.__typename = "Shop"
		}
	}
}
}
