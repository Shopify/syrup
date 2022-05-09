// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DuplicatedFragmentResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Updates an order.
		public var orderUpdate: OrderUpdate?
		/// Updates a customer's attributes.
		public var customerUpdate: CustomerUpdate?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(orderUpdate: OrderUpdate?, customerUpdate: CustomerUpdate?) {
			self.orderUpdate = orderUpdate
			self.customerUpdate = customerUpdate
			self.__typename = "Mutation"
	}

		// MARK: - Nested Types
			public struct OrderUpdate: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// List of errors that occurred executing the mutation.
			public var userErrors: [UserErrors]
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(userErrors: [UserErrors]) {
				self.userErrors = userErrors
				self.__typename = "OrderUpdatePayload"
		}
			// MARK: - Nested Types
				public struct UserErrors: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// Path to the input field which caused the error.
				public var field: [String]? {
					get {
						return asUserErrorsFragment.field
					}
					set {
						asUserErrorsFragment.field = newValue
					}
				}
				/// The error message.
				public var message: String {
					get {
						return asUserErrorsFragment.message
					}
					set {
						asUserErrorsFragment.message = newValue
					}
				}
				public var asUserErrorsFragment: MerchantApi.UserErrors
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				private enum CodingKeys: String, CodingKey {
					case __typename
						case asUserErrorsFragment = "fragment:asUserErrorsFragment"
				}
				public init(from decoder: Decoder) throws {
					let container = try decoder.container(keyedBy: CodingKeys.self)
					self.__typename = try container.decode(String.self, forKey: .__typename)
						do {
							self.asUserErrorsFragment = try MerchantApi.UserErrors(from: decoder)
						} catch let originalError {
							do {
								self.asUserErrorsFragment = try container.decode(MerchantApi.UserErrors.self, forKey: .asUserErrorsFragment)
							} catch {
									throw originalError
							}
						}
				}
			public init(userErrorsFragment: MerchantApi.UserErrors) {
					self.asUserErrorsFragment = userErrorsFragment
					self.__typename = "UserError"
			}
		}
	}
			public struct CustomerUpdate: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// List of errors that occurred executing the mutation.
			public var userErrors: [UserErrors]
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(userErrors: [UserErrors]) {
				self.userErrors = userErrors
				self.__typename = "CustomerUpdatePayload"
		}
			// MARK: - Nested Types
				public struct UserErrors: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// Path to the input field which caused the error.
				public var field: [String]? {
					get {
						return asUserErrorsFragment.field
					}
					set {
						asUserErrorsFragment.field = newValue
					}
				}
				/// The error message.
				public var message: String {
					get {
						return asUserErrorsFragment.message
					}
					set {
						asUserErrorsFragment.message = newValue
					}
				}
				public var asUserErrorsFragment: MerchantApi.UserErrors
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				private enum CodingKeys: String, CodingKey {
					case __typename
						case asUserErrorsFragment = "fragment:asUserErrorsFragment"
				}
				public init(from decoder: Decoder) throws {
					let container = try decoder.container(keyedBy: CodingKeys.self)
					self.__typename = try container.decode(String.self, forKey: .__typename)
						do {
							self.asUserErrorsFragment = try MerchantApi.UserErrors(from: decoder)
						} catch let originalError {
							do {
								self.asUserErrorsFragment = try container.decode(MerchantApi.UserErrors.self, forKey: .asUserErrorsFragment)
							} catch {
									throw originalError
							}
						}
				}
			public init(userErrorsFragment: MerchantApi.UserErrors) {
					self.asUserErrorsFragment = userErrorsFragment
					self.__typename = "UserError"
			}
		}
	}
}
}
