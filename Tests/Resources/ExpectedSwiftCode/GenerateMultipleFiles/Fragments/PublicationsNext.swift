// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Publications: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// A list of edges.
		public var edges: [Edges]

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(edges: [Edges]) {
			self.edges = edges
			self.__typename = "ResourcePublicationConnection"
	}

		// MARK: - Nested Types
			public struct Edges: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The item at the end of ResourcePublicationEdge.
			public var node: Node
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(node: Node) {
				self.node = node
				self.__typename = "ResourcePublicationEdge"
		}
			// MARK: - Nested Types
				public struct Node: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// Whether the resource publication is published. Also returns true if the resource publication is scheduled to be published.
				/// If false, then the resource publication is neither published nor scheduled to be published.
				public var isPublished: Bool
				/// The date that the resource publication was or is going to be published to the publication.
				public var publishDate: Date
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(isPublished: Bool, publishDate: Date) {
					self.isPublished = isPublished
					self.publishDate = publishDate
					self.__typename = "ResourcePublication"
			}
		}
	}
}
}


extension MerchantApi.Publications {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "Publications",
    typeCondition: .object("ResourcePublicationConnection"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublicationConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublicationConnection"), type: .object("ResourcePublicationEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublicationEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublicationEdge"), type: .object("ResourcePublication"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublication"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "isPublished", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublication"), type: .scalar("Boolean"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "publishDate", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublication"), type: .scalar("DateTime"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
