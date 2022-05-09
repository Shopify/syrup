// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct UserErrors: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Path to the input field which caused the error.
		public var field: [String]?
		/// The error message.
		public var message: String

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(field: [String]?, message: String) {
			self.field = field
			self.message = message
			self.__typename = "UserError"
	}

}
}


extension MerchantApi.UserErrors {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "UserErrors",
    typeCondition: .object("UserError"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("UserError"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "field", alias: nil
, arguments: 
  []
, parentType: .object("UserError"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "message", alias: nil
, arguments: 
  []
, parentType: .object("UserError"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  )
}
