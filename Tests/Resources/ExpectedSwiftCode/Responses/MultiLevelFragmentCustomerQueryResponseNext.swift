// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultiLevelFragmentCustomerQueryResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a Shop resource corresponding to access token used in request.
		public var shop: Shop

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(shop: Shop) {
			self.shop = shop
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Shop: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Customer accounts associated to the shop.
			/// - Warning:
			/// Use `QueryRoot.customers` instead.
	@available(*, deprecated, message: "")
			public var customers: Customers
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(customers: Customers) {
				self.customers = customers
				self.__typename = "Shop"
		}
			// MARK: - Nested Types
				public struct Customers: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// A list of edges.
				public var edges: [Edges]
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(edges: [Edges]) {
					self.edges = edges
					self.__typename = "CustomerConnection"
			}
				// MARK: - Nested Types
					public struct Edges: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// The item at the end of CustomerEdge.
					public var node: Node
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(node: Node) {
						self.node = node
						self.__typename = "CustomerEdge"
				}
					// MARK: - Nested Types
						@dynamicMemberLookup
				public struct Node: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.MultiLevelFragment, T>) -> T {
							get { asMultiLevelFragmentFragment[keyPath: keyPath] }
							set { asMultiLevelFragmentFragment[keyPath: keyPath] = newValue }
						}
						public var asMultiLevelFragmentFragment: MerchantApi.MultiLevelFragment
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
						private enum CodingKeys: String, CodingKey {
							case __typename
								case asMultiLevelFragmentFragment = "fragment:asMultiLevelFragmentFragment"
						}
						public init(from decoder: Decoder) throws {
							let container = try decoder.container(keyedBy: CodingKeys.self)
							self.__typename = try container.decode(String.self, forKey: .__typename)
								do {
									self.asMultiLevelFragmentFragment = try MerchantApi.MultiLevelFragment(from: decoder)
								} catch let originalError {
									do {
										self.asMultiLevelFragmentFragment = try container.decode(MerchantApi.MultiLevelFragment.self, forKey: .asMultiLevelFragmentFragment)
									} catch {
											throw originalError
									}
								}
						}
					public init(multiLevelFragmentFragment: MerchantApi.MultiLevelFragment) {
							self.asMultiLevelFragmentFragment = multiLevelFragmentFragment
							self.__typename = "Customer"
					}
				}
			}
		}
	}
}
}
