// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct WithInputVariableResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Updates a customer's attributes.
		public var customerUpdate: CustomerUpdate?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(customerUpdate: CustomerUpdate?) {
			self.customerUpdate = customerUpdate
			self.__typename = "Mutation"
	}

		// MARK: - Nested Types
			public struct CustomerUpdate: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The updated customer.
			public var customer: Customer?
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(customer: Customer?) {
				self.customer = customer
				self.__typename = "CustomerUpdatePayload"
		}
			// MARK: - Nested Types
				public struct Customer: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// Globally unique identifier.
				public var id: GraphID
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(id: GraphID) {
					self.id = id
					self.__typename = "Customer"
			}
		}
	}
}
}
