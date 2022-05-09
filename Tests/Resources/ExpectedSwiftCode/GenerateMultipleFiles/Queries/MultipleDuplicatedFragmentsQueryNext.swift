// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct MultipleDuplicatedFragmentsQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = MultipleDuplicatedFragmentsResponse

		public let queryString: String = """
		fragment DuplicatedFragment on Shop { __typename name features { __typename storefront } ... Features } fragment Features on Shop { __typename features { __typename shopifyPlus } } query MultipleDuplicatedFragments { __typename shop { __typename ... DuplicatedFragment } }
		"""
	}
}


extension MerchantApi.MultipleDuplicatedFragmentsQuery {
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
  .fragmentSpread(MerchantApi.DuplicatedFragment.fragmentSpread
)
  ]
  ))
  ]
  )
}
