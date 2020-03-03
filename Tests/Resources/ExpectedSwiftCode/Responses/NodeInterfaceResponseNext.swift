// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct NodeInterfaceResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a specific node by ID.
		public var node: Node?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(node: Node?) {
			self.node = node
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
public struct Node: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BaseNode
	public var __typename: String
	// MARK: - Common Fields
		/// Globally unique identifier.
		public var id: GraphID {
			get {
				return common.id
			}
			set {
				common.id = newValue
			}
		}
		public typealias Metafields = BaseNode.Metafields
		/// A paginated list of metafields associated with the resource.
		public var metafields: Metafields? {
			get {
				return common.metafields
			}
			set {
				common.metafields = newValue
			}
		}
		public var asMetafieldFragment: MerchantApi.Metafield? {
			return common.asMetafieldFragment
		}
	public enum Realized: Equatable {
		case base(BaseNode)
	}
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	private enum CodingKeys: String, CodingKey {
		case __typename = "__typename"
	}
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.__typename = try container.decode(String.self, forKey: .__typename)
		switch __typename {
		default:
			self.realized = .base(try BaseNode(from: decoder))
		}
		self.common = try BaseNode(from: decoder)
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
		case .base(let value):
			try value.encode(to: encoder)
		}
	}
	public init(__typename: String, realized: Realized, id: GraphID, metafields: Metafields?, metafieldFragment: MerchantApi.Metafield?) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseNode(id: id, metafields: metafields, metafieldFragment: metafieldFragment)
	}
public struct BaseNode: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Globally unique identifier.
		public var id: GraphID
		/// A paginated list of metafields associated with the resource.
		public var metafields: Metafields?
		public var asMetafieldFragment: MerchantApi.Metafield?
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
				self.metafields = try container.decodeIfPresent(Metafields.self, forKey: .metafields)
				do {
					self.asMetafieldFragment = try MerchantApi.Metafield(from: decoder)
				} catch  {
					do {
						self.asMetafieldFragment = try container.decode(MerchantApi.Metafield?.self, forKey: .asMetafieldFragment)
					} catch {
							self.asMetafieldFragment = nil
					}
				}
		}
	public init(id: GraphID, metafields: Metafields?, metafieldFragment: MerchantApi.Metafield?) {
			self.id = id
			self.metafields = metafields
			self.asMetafieldFragment = metafieldFragment
			self.__typename = "Node"
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
}
