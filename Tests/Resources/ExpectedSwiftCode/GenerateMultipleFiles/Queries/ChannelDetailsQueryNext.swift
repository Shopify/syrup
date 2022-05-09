// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct ChannelDetailsQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let id: GraphID

		// MARK: - Initializer
		public init(id: GraphID) {
				self.id = id
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
				case id
		}

		public typealias Response = ChannelDetailsResponse

		public let queryString: String = """
		fragment ChannelDetailsFields on App { __typename failedRequirements { __typename action { __typename title url } message } screenshots { __typename transformedSrc } icon { __typename transformedSrc } title pricingDetails pricingDetailsSummary description features installUrl } query ChannelDetails($id: ID!) { __typename node(id: $id) { __typename ... on App { __typename ... ChannelDetailsFields } } }
		"""
	}
}


extension MerchantApi.ChannelDetailsQuery {
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
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
    .variable("id")
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
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("App")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.ChannelDetailsFields.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
