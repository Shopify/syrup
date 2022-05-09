// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct ConditionalDirectivesQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let someCondition: Bool

		// MARK: - Initializer
		public init(someCondition: Bool) {
				self.someCondition = someCondition
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
				case someCondition
		}

		public typealias Response = ConditionalDirectivesResponse

		public let queryString: String = """
		fragment ConditionalDirectivesFrag1 on Shop { __typename features { __typename shopifyPlus multiLocation @skip(if: $someCondition) } } query ConditionalDirectives($someCondition: Boolean!) { __typename shop { __typename primaryDomain @include(if: false) { __typename url } ... ConditionalDirectivesFrag1 } }
		"""
	}
}


extension MerchantApi.ConditionalDirectivesQuery {
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
  .field(GraphSelections.Field(name: "primaryDomain", alias: nil
    , conditionalDirective: .include(
    .booleanValue(false)
)
, arguments: 
  []
, parentType: .object("Shop"), type: .object("Domain"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Domain"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "url", alias: nil
, arguments: 
  []
, parentType: .object("Domain"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .fragmentSpread(MerchantApi.ConditionalDirectivesFrag1.fragmentSpread
)
  ]
  ))
  ]
  )
}
