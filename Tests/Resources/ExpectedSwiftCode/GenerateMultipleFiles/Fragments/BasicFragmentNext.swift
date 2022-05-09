// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct BasicFragment: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Globally unique identifier.
		public var id: GraphID
		/// A note about the customer.
		public var note: String?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(id: GraphID, note: String?) {
			self.id = id
			self.note = note
			self.__typename = "Customer"
	}

}
}


extension MerchantApi.BasicFragment {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "BasicFragment",
    typeCondition: .object("Customer"),
    selectionSet: 
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
  , 
  .field(GraphSelections.Field(name: "note", alias: nil
, arguments: 
  []
, parentType: .object("Customer"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  )
}
