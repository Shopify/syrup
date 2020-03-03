// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct MultiLevelInterfaceFragmentWithOnlyInlineFragments: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// A list of edges.
		public var edges: [Edges]

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(edges: [Edges]) {
			self.edges = edges
			self.__typename = "EventConnection"
	}

		// MARK: - Nested Types
			public struct Edges: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The item at the end of EventEdge.
			public var node: Node
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(node: Node) {
				self.node = node
				self.__typename = "EventEdge"
		}
			// MARK: - Nested Types
	public struct Node: GraphApiResponse, Equatable {
		public var realized: Realized
		private var common: BaseEvent
		public var __typename: String
		public enum Realized: Equatable {
				case commentEvent(CommentEvent)
			case base(BaseEvent)
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
				case "CommentEvent":
					self.realized = .commentEvent(try CommentEvent(from: decoder))
			default:
				self.realized = .base(try BaseEvent(from: decoder))
			}
			self.common = try BaseEvent(from: decoder)
		}
		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(__typename, forKey: .__typename)
			switch realized {
				case .commentEvent(let value):
					try value.encode(to: encoder)
			case .base(let value):
				try value.encode(to: encoder)
			}
		}
		public init(__typename: String, realized: Realized) {
			self.__typename = __typename
			self.realized = realized
			self.common = BaseEvent()
		}
	public struct CommentEvent: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Globally unique identifier.
			public var id: GraphID
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(id: GraphID) {
				self.id = id
				self.__typename = "CommentEvent"
		}
	}
	public struct BaseEvent: GraphApiResponse, Equatable {
		// MARK: - Response Fields
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init() {
				self.__typename = "Event"
		}
	}
	}
	}
}
}


extension MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "MultiLevelInterfaceFragmentWithOnlyInlineFragments",
    typeCondition: .object("EventConnection"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("EventConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("EventConnection"), type: .object("EventEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("EventEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("EventEdge"), type: .interface("Event"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Event"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Event"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("CommentEvent")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CommentEvent"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("CommentEvent"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
