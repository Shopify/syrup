// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct MultipleFragmentsQueryQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = MultipleFragmentsQueryResponse

		public let queryString: String = """
		fragment BasicFragment on Customer { __typename id note } fragment MultiLevelFragment on Customer { __typename lastOrder { __typename customerJourney { __typename firstVisit { __typename id } } } } query MultipleFragmentsQuery { __typename shop { __typename customers(first: 10) { __typename edges { __typename node { __typename ... BasicFragment ... MultiLevelFragment } } } } }
		"""
	}
}


extension MerchantApi.MultipleFragmentsQueryQuery {
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
  .field(GraphSelections.Field(name: "shop", alias: nil
, arguments: 
  []
, parentType: .object("QueryRoot"), type: .object("Shop"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "customers", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(10)
)
  ]
, parentType: .object("Shop"), type: .object("CustomerConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("CustomerConnection"), type: .object("CustomerEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("CustomerEdge"), type: .object("Customer"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.BasicFragment.fragmentSpread
)
  , 
  .fragmentSpread(MerchantApi.MultiLevelFragment.fragmentSpread
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
  )
}
