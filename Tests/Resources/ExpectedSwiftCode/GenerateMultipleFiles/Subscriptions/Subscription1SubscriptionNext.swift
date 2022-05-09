// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	struct Subscription1Subscription: GraphApiQuery, ResponseAssociable, Equatable {
		// MARK: - Query Variables

		// MARK: - Initializer
		public init() {
		}

		// MARK: - Helpers

		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: CodingKey {
		}

		public typealias Response = Subscription1Response

		public let queryString: String = """
		subscription Subscription1 { presenceChanged }
		"""
	}
}


extension MerchantApi.Subscription1Subscription {
  public static let operationSelections: GraphSelections.Operation? = GraphSelections.Operation(
    type: .subscription("Subscription"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "presenceChanged", alias: nil
, arguments: 
  []
, parentType: .object("Subscription"), type: .scalar("Boolean"), selectionSet: 
  []
  ))
  ]
  )
}
