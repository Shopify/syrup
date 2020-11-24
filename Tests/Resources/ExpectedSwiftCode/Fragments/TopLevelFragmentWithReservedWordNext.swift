// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct TopLevelFragmentWithReservedWord: GraphApiResponse, Equatable {
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
	public enum Realized: Equatable {
			case product(Product)
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
			case "Product":
				self.realized = .product(try Product(from: decoder))
		default:
			self.realized = .base(try BaseNode(from: decoder))
		}
		self.common = try BaseNode(from: decoder)
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .product(let value):
				try value.encode(to: encoder)
		case .base(let value):
			try value.encode(to: encoder)
		}
	}
	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseNode()
	}
public struct Product: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Globally unique identifier.
		public var `var`: GraphID
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(`var`: GraphID) {
			self.`var` = `var`
			self.__typename = "Product"
	}
}
public struct BaseNode: GraphApiResponse, Equatable {
	// MARK: - Response Fields
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init() {
			self.__typename = "Node"
	}
}
}
}
}


extension MerchantApi.TopLevelFragmentWithReservedWord {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "TopLevelFragmentWithReservedWord",
    typeCondition: .object("QueryRoot"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("QueryRoot"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("")
)
  ]
, parentType: .object("QueryRoot"), type: .interface("Node"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Node"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("Product")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: "var"
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
