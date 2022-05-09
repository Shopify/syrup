// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Metafield: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BaseHasMetafields
	public var __typename: String

	// MARK: - Common Fields
		public typealias Metafield = BaseHasMetafields.Metafield
		/// The metafield associated with the resource.
		public var metafield: Metafield? {
			get {
				return common.metafield
			}
			set {
				common.metafield = newValue
			}
		}

	public enum Realized: Equatable {
		case base(BaseHasMetafields)
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
			self.realized = .base(try BaseHasMetafields(from: decoder))
		}
		self.common = try BaseHasMetafields(from: decoder)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
		case .base(let value):
			try value.encode(to: encoder)
		}
	}

	public init(__typename: String, realized: Realized, metafield: Metafield?) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseHasMetafields(metafield: metafield)
	}

public struct BaseHasMetafields: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The metafield associated with the resource.
		public var metafield: Metafield?
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(metafield: Metafield?) {
			self.metafield = metafield
			self.__typename = "HasMetafields"
	}
		// MARK: - Nested Types
			public struct Metafield: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The description of a metafield.
			public var description: String?
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(description: String?) {
				self.description = description
				self.__typename = "Metafield"
		}
	}
}
}
}


extension MerchantApi.Metafield {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "Metafield",
    typeCondition: .interface("HasMetafields"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("HasMetafields"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "metafield", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "namespace", value: 
      .stringValue("someNamespace")
)
  , 
    GraphSelections.Argument(name: "key", value: 
      .stringValue("someKey")
)
  ]
, parentType: .interface("HasMetafields"), type: .object("Metafield"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Metafield"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "description", alias: nil
, arguments: 
  []
, parentType: .object("Metafield"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
