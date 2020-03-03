// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DuplicatedFragment: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The shop's name.
		public var name: String
		/// The shop's features.
		public var features: Features

		public var asFeaturesFragment: MerchantApi.Features

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: String, CodingKey {
			case __typename
				case name
				case features
				case asFeaturesFragment = "fragment:asFeaturesFragment"
		}

		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				self.name = try container.decode(String.self, forKey: .name)
				self.features = try container.decode(Features.self, forKey: .features)
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

	public init(name: String, features: Features, featuresFragment: MerchantApi.Features) {
			self.name = name
			self.features = features
			self.asFeaturesFragment = featuresFragment
			self.__typename = "Shop"
	}

		// MARK: - Nested Types
			public struct Features: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Whether the shop has an online storefront.
			public var storefront: Bool
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(storefront: Bool) {
				self.storefront = storefront
				self.__typename = "ShopFeatures"
		}
	}
}
}


extension MerchantApi.DuplicatedFragment {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "DuplicatedFragment",
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
  .field(GraphSelections.Field(name: "name", alias: nil
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
  , 
  .fragmentSpread(MerchantApi.Features.fragmentSpread
)
  ]
  )
}
