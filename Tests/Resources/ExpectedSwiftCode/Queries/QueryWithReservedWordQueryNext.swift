// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct QueryWithReservedWordQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = QueryWithReservedWordResponse

		public let queryString: String = """
		query QueryWithReservedWord { __typename class: shop { __typename return: id func: name } }
		"""
	}
}


extension MerchantApi.QueryWithReservedWordQuery {
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
  .field(GraphSelections.Field(name: "shop", alias: "class"
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
  .field(GraphSelections.Field(name: "id", alias: "return"
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("ID"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "name", alias: "func"
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
