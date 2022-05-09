// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct ConditionalDirectives2Query: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = ConditionalDirectives2Response

		public let queryString: String = """
		fragment ConditionalDirectivesFrag2 on QueryRoot { __typename shop { __typename features { __typename shopifyPlus } } } query ConditionalDirectives2 { __typename ... ConditionalDirectivesFrag2 @include(if: false) }
		"""
	}
}


extension MerchantApi.ConditionalDirectives2Query {
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
  .fragmentSpread(MerchantApi.ConditionalDirectivesFrag2.fragmentSpread
    , conditionalDirective: .include(
    .booleanValue(false)
)
)
  ]
  )
}
