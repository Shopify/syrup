// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct CustomerEventsResponse: GraphApiResponse, Equatable {
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
			/// A list of events associated with the customer.
			public var events: Events
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(events: Events) {
				self.events = events
				self.__typename = "Customer"
		}
			// MARK: - Nested Types
				@dynamicMemberLookup
		public struct Events: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.MultiLevelInterfaceFragment, T>) -> T {
					get { asMultiLevelInterfaceFragmentFragment[keyPath: keyPath] }
					set { asMultiLevelInterfaceFragmentFragment[keyPath: keyPath] = newValue }
				}
				public var asMultiLevelInterfaceFragmentFragment: MerchantApi.MultiLevelInterfaceFragment
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				private enum CodingKeys: String, CodingKey {
					case __typename
						case asMultiLevelInterfaceFragmentFragment = "fragment:asMultiLevelInterfaceFragmentFragment"
				}
				public init(from decoder: Decoder) throws {
					let container = try decoder.container(keyedBy: CodingKeys.self)
					self.__typename = try container.decode(String.self, forKey: .__typename)
						do {
							self.asMultiLevelInterfaceFragmentFragment = try MerchantApi.MultiLevelInterfaceFragment(from: decoder)
						} catch let originalError {
							do {
								self.asMultiLevelInterfaceFragmentFragment = try container.decode(MerchantApi.MultiLevelInterfaceFragment.self, forKey: .asMultiLevelInterfaceFragmentFragment)
							} catch {
									throw originalError
							}
						}
				}
			public init(multiLevelInterfaceFragmentFragment: MerchantApi.MultiLevelInterfaceFragment) {
					self.asMultiLevelInterfaceFragmentFragment = multiLevelInterfaceFragmentFragment
					self.__typename = "EventConnection"
			}
		}
	}
}
}
