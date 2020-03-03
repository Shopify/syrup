// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct NullableCustomCodedScalarQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = NullableCustomCodedScalarResponse

		public let queryString: String = """
		query NullableCustomCodedScalar { __typename currentBulkOperation { __typename fileSize } }
		"""
	}
}


extension MerchantApi.NullableCustomCodedScalarQuery {
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
  .field(GraphSelections.Field(name: "currentBulkOperation", alias: nil
, arguments: 
  []
, parentType: .object("QueryRoot"), type: .object("BulkOperation"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("BulkOperation"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "fileSize", alias: nil
, arguments: 
  []
, parentType: .object("BulkOperation"), type: .scalar("UnsignedInt64"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
