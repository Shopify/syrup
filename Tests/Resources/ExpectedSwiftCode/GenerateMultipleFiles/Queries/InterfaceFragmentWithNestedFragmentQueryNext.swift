// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct InterfaceFragmentWithNestedFragmentQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = InterfaceFragmentWithNestedFragmentResponse

		public let queryString: String = """
		fragment InterfaceFragmentWithNestedFragment on Publishable { __typename availablePublicationCount resourcePublications { __typename ... Publications } } fragment Publications on ResourcePublicationConnection { __typename edges { __typename node { __typename isPublished publishDate } } } query InterfaceFragmentWithNestedFragment { __typename publication(id: "") { __typename collectionPublicationsV3(first: 10) { __typename edges { __typename node { __typename publishable { __typename ... InterfaceFragmentWithNestedFragment } } } } } }
		"""
	}
}


extension MerchantApi.InterfaceFragmentWithNestedFragmentQuery {
  public static let operationSelections: GraphSelections.Operation? = GraphSelections.Operation(
    type: .query("QueryRoot"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("QueryRoot"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "publication", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("")
)
  ]
, parentType: .object("QueryRoot"), type: .object("Publication"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Publication"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "collectionPublicationsV3", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(10)
)
  ]
, parentType: .object("Publication"), type: .object("ResourcePublicationConnection"), selectionSet: 
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
  .field(GraphSelections.Field(name: "publishable", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublication"), type: .interface("Publishable"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Publishable"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.InterfaceFragmentWithNestedFragment.fragmentSpread
)
  ]
  ))
  ]
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
