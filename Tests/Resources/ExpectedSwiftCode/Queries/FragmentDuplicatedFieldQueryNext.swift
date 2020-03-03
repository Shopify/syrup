// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct FragmentDuplicatedFieldQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = FragmentDuplicatedFieldResponse

		public let queryString: String = """
		fragment Features on Shop { __typename features { __typename shopifyPlus } } query FragmentDuplicatedField { __typename shop { __typename name id features { __typename storefront } ... Features } }
		"""
	}
}


extension MerchantApi.FragmentDuplicatedFieldQuery {
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
  .field(GraphSelections.Field(name: "name", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("ID"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "features", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .object("ShopFeatures"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ShopFeatures"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "storefront", alias: nil
, arguments: 
  []
, parentType: .object("ShopFeatures"), type: .scalar("Boolean"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .fragmentSpread(MerchantApi.Features.fragmentSpread
)
  ]
  ))
  ]
  )
}
