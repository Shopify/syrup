// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct ConditionalDirectiveInlineFragmentQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = ConditionalDirectiveInlineFragmentResponse

		public let queryString: String = """
		query ConditionalDirectiveInlineFragment { __typename node(id: "123") { __typename id ... on Product @include(if: true) { __typename title } } }
		"""
	}
}


extension MerchantApi.ConditionalDirectiveInlineFragmentQuery {
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
      .stringValue("123")
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
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .interface("Node"), type: .scalar("ID"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("Product")
    , conditionalDirective: .include(
    .booleanValue(true)
)
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "title", alias: nil
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
