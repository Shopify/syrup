// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct InterfaceFragmentDiscountsQueryResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// List of code discounts. Special fields for query params:
		///  * status: active, expired, scheduled
		///  * type: bxgy, fixed_amount, free_shipping, percentage.
		public var codeDiscountNodes: CodeDiscountNodes

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(codeDiscountNodes: CodeDiscountNodes) {
			self.codeDiscountNodes = codeDiscountNodes
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct CodeDiscountNodes: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// A list of edges.
			public var edges: [Edges]
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(edges: [Edges]) {
				self.edges = edges
				self.__typename = "DiscountCodeNodeConnection"
		}
			// MARK: - Nested Types
				public struct Edges: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// The item at the end of DiscountCodeNodeEdge.
				public var node: Node
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(node: Node) {
					self.node = node
					self.__typename = "DiscountCodeNodeEdge"
			}
				// MARK: - Nested Types
					public struct Node: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// A code discount.
					public var codeDiscount: CodeDiscount
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(codeDiscount: CodeDiscount) {
						self.codeDiscount = codeDiscount
						self.__typename = "DiscountCodeNode"
				}
					// MARK: - Nested Types
			public struct CodeDiscount: GraphApiResponse, Equatable {
				public var realized: Realized
				public var __typename: String
					public var asInterfaceFragmentFragment: MerchantApi.InterfaceFragment
				public enum Realized: Equatable {
					case unknown
				}
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				private enum CodingKeys: String, CodingKey {
					case __typename = "__typename"
						case asInterfaceFragmentFragment = "fragment:asInterfaceFragmentFragment"
				}
				public init(from decoder: Decoder) throws {
					let container = try decoder.container(keyedBy: CodingKeys.self)
					self.__typename = try container.decode(String.self, forKey: .__typename)
					switch __typename {
					default:
						self.realized = .unknown
					}
						do {
							self.asInterfaceFragmentFragment = try MerchantApi.InterfaceFragment(from: decoder)
						} catch {
							self.asInterfaceFragmentFragment = try container.decode(MerchantApi.InterfaceFragment.self, forKey: .asInterfaceFragmentFragment)
						}
				}
				public func encode(to encoder: Encoder) throws {
					var container = encoder.container(keyedBy: CodingKeys.self)
					try container.encode(__typename, forKey: .__typename)
					switch realized {
					case .unknown:
						break
					}
						try container.encode(asInterfaceFragmentFragment, forKey: .asInterfaceFragmentFragment)
				}
				public init(__typename: String, realized: Realized, interfaceFragmentFragment: MerchantApi.InterfaceFragment) {
					self.__typename = __typename
					self.realized = realized
						self.asInterfaceFragmentFragment = interfaceFragmentFragment
				}
			}
			}
		}
	}
}
}
