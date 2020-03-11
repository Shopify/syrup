// Syrup auto-generated file
import Foundation

public extension MerchantApi {
@dynamicMemberLookup

struct NestedFragmentSpread: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Globally unique identifier.
		public var id: GraphID

		public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.Features, T>) -> T {
			get { asFeaturesFragment[keyPath: keyPath] }
			set { asFeaturesFragment[keyPath: keyPath] = newValue }
		}

		public var asFeaturesFragment: MerchantApi.Features

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: String, CodingKey {
			case __typename
				case id
				case asFeaturesFragment = "fragment:asFeaturesFragment"
		}

		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				self.id = try container.decode(GraphID.self, forKey: .id)
				do {
					self.asFeaturesFragment = try MerchantApi.Features(from: decoder)
				} catch let originalError {
					do {
						self.asFeaturesFragment = try container.decode(MerchantApi.Features.self, forKey: .asFeaturesFragment)
					} catch {
							throw originalError
					}
				}
		}

	public init(id: GraphID, featuresFragment: MerchantApi.Features) {
			self.id = id
			self.asFeaturesFragment = featuresFragment
			self.__typename = "Shop"
	}

}
}


extension MerchantApi.NestedFragmentSpread {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "NestedFragmentSpread",
    typeCondition: .object("Shop"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.Features.fragmentSpread
)
  , 
  .field(GraphSelections.Field(name: "id", alias: nil
, arguments: 
  []
, parentType: .object("Shop"), type: .scalar("ID"), selectionSet: 
  []
  ))
  ]
  )
}
