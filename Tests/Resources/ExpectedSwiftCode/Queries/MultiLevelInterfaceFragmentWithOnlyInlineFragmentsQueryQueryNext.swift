// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct MultiLevelInterfaceFragmentWithOnlyInlineFragmentsQueryQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = MultiLevelInterfaceFragmentWithOnlyInlineFragmentsQueryResponse

		public let queryString: String = """
		fragment MultiLevelInterfaceFragmentWithOnlyInlineFragments on EventConnection { __typename edges { __typename node { __typename __typename ... on CommentEvent { __typename id } } } } query MultiLevelInterfaceFragmentWithOnlyInlineFragmentsQuery { __typename customer(id: "") { __typename events(first: 1) { __typename ... MultiLevelInterfaceFragmentWithOnlyInlineFragments } } }
		"""
	}
}


extension MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragmentsQueryQuery {
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
  .field(GraphSelections.Field(name: "customer", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("")
)
  ]
, parentType: .object("QueryRoot"), type: .object("Customer"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "events", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(1)
)
  ]
, parentType: .object("Customer"), type: .object("EventConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("EventConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.MultiLevelInterfaceFragmentWithOnlyInlineFragments.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
