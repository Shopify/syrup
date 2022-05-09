// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultipleFragmentsQueryResponse: GraphApiResponse, Equatable {
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
						public struct Node: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						/// Globally unique identifier.
						public var id: GraphID {
							get {
								return asBasicFragmentFragment.id
							}
							set {
								asBasicFragmentFragment.id = newValue
							}
						}
						/// A note about the customer.
						public var note: String? {
							get {
								return asBasicFragmentFragment.note
							}
							set {
								asBasicFragmentFragment.note = newValue
							}
						}
						/// The customer's last order.
						public var lastOrder: MerchantApi.MultiLevelFragment.LastOrder? {
							get {
								return asMultiLevelFragmentFragment.lastOrder
							}
							set {
								asMultiLevelFragmentFragment.lastOrder = newValue
							}
						}
						public var asBasicFragmentFragment: MerchantApi.BasicFragment
						public var asMultiLevelFragmentFragment: MerchantApi.MultiLevelFragment
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
						private enum CodingKeys: String, CodingKey {
							case __typename
								case asBasicFragmentFragment = "fragment:asBasicFragmentFragment"
								case asMultiLevelFragmentFragment = "fragment:asMultiLevelFragmentFragment"
						}
						public init(from decoder: Decoder) throws {
							let container = try decoder.container(keyedBy: CodingKeys.self)
							self.__typename = try container.decode(String.self, forKey: .__typename)
								do {
									self.asBasicFragmentFragment = try MerchantApi.BasicFragment(from: decoder)
								} catch let originalError {
									do {
										self.asBasicFragmentFragment = try container.decode(MerchantApi.BasicFragment.self, forKey: .asBasicFragmentFragment)
									} catch {
											throw originalError
									}
								}
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
					public init(basicFragmentFragment: MerchantApi.BasicFragment, multiLevelFragmentFragment: MerchantApi.MultiLevelFragment) {
							self.asBasicFragmentFragment = basicFragmentFragment
							self.asMultiLevelFragmentFragment = multiLevelFragmentFragment
							self.__typename = "Customer"
					}
				}
			}
		}
	}
}
}
