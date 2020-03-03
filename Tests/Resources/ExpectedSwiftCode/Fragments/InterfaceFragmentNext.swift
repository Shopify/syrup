// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct InterfaceFragment: GraphApiResponse, Equatable {
	public var realized: Realized
	public var __typename: String

	public enum Realized: Equatable {
			case discountCodeBasic(DiscountCodeBasic)
		case unknown
	}

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	private enum CodingKeys: String, CodingKey {
		case __typename = "__typename"
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.__typename = try container.decode(String.self, forKey: .__typename)
		switch __typename {
			case "DiscountCodeBasic":
				self.realized = .discountCodeBasic(try DiscountCodeBasic(from: decoder))
		default:
			self.realized = .unknown
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .discountCodeBasic(let value):
				try value.encode(to: encoder)
		case .unknown:
			break
		}
	}

	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
	}

public struct DiscountCodeBasic: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The date and time when the discount was created.
		public var createdAt: Date
		/// URLs that can be used to share the discount.
		public var shareableUrls: [ShareableUrls]
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(createdAt: Date, shareableUrls: [ShareableUrls]) {
			self.createdAt = createdAt
			self.shareableUrls = shareableUrls
			self.__typename = "DiscountCodeBasic"
	}
		// MARK: - Nested Types
			public struct ShareableUrls: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The title of the page that's associated with the URL.
			public var title: String
			/// The URL for the discount code.
			public var url: URL
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(title: String, url: URL) {
				self.title = title
				self.url = url
				self.__typename = "DiscountShareableUrl"
		}
	}
}
}
}


extension MerchantApi.InterfaceFragment {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "InterfaceFragment",
    typeCondition: .union("DiscountCode"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("DiscountCode"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("DiscountCode"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("DiscountCodeBasic")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeBasic"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "createdAt", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeBasic"), type: .scalar("DateTime"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "shareableUrls", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeBasic"), type: .object("DiscountShareableUrl"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountShareableUrl"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "title", alias: nil
, arguments: 
  []
, parentType: .object("DiscountShareableUrl"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "url", alias: nil
, arguments: 
  []
, parentType: .object("DiscountShareableUrl"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  ))
  ]
  )
}
