// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct ProductInterfaceResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a Product resource by ID.
		public var product: Product?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(product: Product?) {
			self.product = product
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Product: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Globally unique identifier.
			public var id: GraphID
			/// A paginated list of metafields associated with the resource.
			public var metafields: Metafields
			public var asMetafieldFragment: MerchantApi.Metafield
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case id
					case metafields
					case asMetafieldFragment = "fragment:asMetafieldFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.id = try container.decode(GraphID.self, forKey: .id)
					self.metafields = try container.decode(Metafields.self, forKey: .metafields)
					do {
						self.asMetafieldFragment = try MerchantApi.Metafield(from: decoder)
					} catch let originalError {
						do {
							self.asMetafieldFragment = try container.decode(MerchantApi.Metafield.self, forKey: .asMetafieldFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(id: GraphID, metafields: Metafields, metafieldFragment: MerchantApi.Metafield) {
				self.id = id
				self.metafields = metafields
				self.asMetafieldFragment = metafieldFragment
				self.__typename = "Product"
		}
			// MARK: - Nested Types
				public struct Metafields: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// A list of edges.
				public var edges: [Edges]
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(edges: [Edges]) {
					self.edges = edges
					self.__typename = "MetafieldConnection"
			}
				// MARK: - Nested Types
					public struct Edges: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// The item at the end of MetafieldEdge.
					public var node: Node
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(node: Node) {
						self.node = node
						self.__typename = "MetafieldEdge"
				}
					// MARK: - Nested Types
						public struct Node: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						/// Globally unique identifier.
						public var id: GraphID
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
					public init(id: GraphID) {
							self.id = id
							self.__typename = "Metafield"
					}
				}
			}
		}
	}
}
}
