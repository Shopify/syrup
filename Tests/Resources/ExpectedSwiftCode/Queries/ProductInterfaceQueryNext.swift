// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct ProductInterfaceQuery: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = ProductInterfaceResponse

		public let queryString: String = """
		fragment Metafield on HasMetafields { __typename metafield(namespace: "someNamespace", key: "someKey") { __typename description } } query ProductInterface { __typename product(id: "gid://shopify/Product/123") { __typename id ... on HasMetafields { __typename metafields(first: 1) { __typename edges { __typename node { __typename id } } } ... Metafield } } }
		"""
	}
}


extension MerchantApi.ProductInterfaceQuery {
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
  .field(GraphSelections.Field(name: "product", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "id", value: 
      .stringValue("gid://shopify/Product/123")
)
  ]
, parentType: .object("QueryRoot"), type: .object("Product"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Product"), type: .scalar("ID"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .interface("HasMetafields")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("HasMetafields"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "metafields", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "first", value: 
    .intValue(1)
)
  ]
, parentType: .interface("HasMetafields"), type: .object("MetafieldConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("MetafieldConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "edges", alias: nil
, arguments: 
  []
, parentType: .object("MetafieldConnection"), type: .object("MetafieldEdge"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("MetafieldEdge"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "node", alias: nil
, arguments: 
  []
, parentType: .object("MetafieldEdge"), type: .object("Metafield"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Metafield"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Metafield"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  ))
  , 
  .fragmentSpread(MerchantApi.Metafield.fragmentSpread
)
  ]
  ))
  ]
  ))
  ]
  )
}
