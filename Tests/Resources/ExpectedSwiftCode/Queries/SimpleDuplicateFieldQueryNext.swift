// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct SimpleDuplicateFieldQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = SimpleDuplicateFieldResponse

		public let queryString: String = """
		query SimpleDuplicateField { __typename shop { __typename name id id features { __typename shopifyPlus } } shop { __typename features { __typename storefront } } }
		"""
	}
}


extension MerchantApi.SimpleDuplicateFieldQuery {
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
  .field(GraphSelections.Field(name: "shopifyPlus", alias: nil
, arguments: 
  []
, parentType: .object("ShopFeatures"), type: .scalar("Boolean"), selectionSet: 
  []
  ))
  ]
  ))
  ]
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
  ]
  ))
  ]
  )
}
