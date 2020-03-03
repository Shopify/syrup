// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct WithInputVariableMutation: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables
			public let input: CustomerInput

		// MARK: - Initializer
		public init(input: CustomerInput) {
				self.input = input
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
				case input
		}

		public typealias Response = WithInputVariableResponse

		public let queryString: String = """
		mutation WithInputVariable($input: CustomerInput!) { __typename customerUpdate(input: $input) { __typename customer { __typename id } } }
		"""
	}
}


extension MerchantApi.WithInputVariableMutation {
  public static let operationSelections: GraphSelections.Operation? = GraphSelections.Operation(
    type: .mutation("Mutation"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Mutation"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "customerUpdate", alias: nil
, arguments: 
  [
    GraphSelections.Argument(name: "input", value: 
    .variable("input")
)
  ]
, parentType: .object("Mutation"), type: .object("CustomerUpdatePayload"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("CustomerUpdatePayload"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "customer", alias: nil
, arguments: 
  []
, parentType: .object("CustomerUpdatePayload"), type: .object("Customer"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
