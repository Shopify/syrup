// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultiLevelInterfaceFragmentWithOnlyInlineFragmentsQueryResponse: GraphApiResponse, Equatable {
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
				public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments, T>) -> T {
					get { asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment[keyPath: keyPath] }
					set { asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment[keyPath: keyPath] = newValue }
				}
				public var asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment: MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				private enum CodingKeys: String, CodingKey {
					case __typename
						case asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment = "fragment:asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment"
				}
				public init(from decoder: Decoder) throws {
					let container = try decoder.container(keyedBy: CodingKeys.self)
					self.__typename = try container.decode(String.self, forKey: .__typename)
						do {
							self.asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment = try MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments(from: decoder)
						} catch let originalError {
							do {
								self.asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment = try container.decode(MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments.self, forKey: .asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment)
							} catch {
									throw originalError
							}
						}
				}
			public init(multiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment: MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments) {
					self.asMultiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment = multiLevelInterfaceFragmentWithOnlyInlineFragmentsFragment
					self.__typename = "EventConnection"
			}
		}
	}
}
}
