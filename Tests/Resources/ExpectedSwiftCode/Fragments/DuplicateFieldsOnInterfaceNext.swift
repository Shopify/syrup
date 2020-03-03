// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DuplicateFieldsOnInterface: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BaseAppPurchase
	public var __typename: String

	// MARK: - Common Fields
		/// The date and time when the app purchase was created.
		public var createdAt: Date {
			get {
				return common.createdAt
			}
			set {
				common.createdAt = newValue
			}
		}
		public typealias Price = BaseAppPurchase.Price
		/// The amount to be charged to the store for the app purchase.
		public var price: Price {
			get {
				return common.price
			}
			set {
				common.price = newValue
			}
		}

	public enum Realized: Equatable {
			case appPurchaseOneTime(AppPurchaseOneTime)
		case base(BaseAppPurchase)
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
			case "AppPurchaseOneTime":
				self.realized = .appPurchaseOneTime(try AppPurchaseOneTime(from: decoder))
		default:
			self.realized = .base(try BaseAppPurchase(from: decoder))
		}
		self.common = try BaseAppPurchase(from: decoder)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .appPurchaseOneTime(let value):
				try value.encode(to: encoder)
		case .base(let value):
			try value.encode(to: encoder)
		}
	}

	public init(__typename: String, realized: Realized, createdAt: Date, price: Price) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseAppPurchase(createdAt: createdAt, price: price)
	}

public struct AppPurchaseOneTime: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The date and time when the app purchase was created.
		public var createdAt: Date
		/// The amount to be charged to the store for the app purchase.
		public var price: Price
		/// The URL where the merchant is redirected after approving the app purchase.
		public var returnUrl: URL
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(createdAt: Date, price: Price, returnUrl: URL) {
			self.createdAt = createdAt
			self.price = price
			self.returnUrl = returnUrl
			self.__typename = "AppPurchaseOneTime"
	}
		// MARK: - Nested Types
			public struct Price: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Decimal money amount.
			public var amount: NSDecimalNumber
			/// Currency of the money.
			public var currencyCode: CurrencyCode
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case amount
					case currencyCode
			}
			public init(from decoder: Decoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.amount = try customScalarResolver.decode(NSDecimalNumber.self, rawValueType: String.self, forKey: .amount, container: container) { (value) -> NSDecimalNumber in
	return try customScalarResolver.decoderForDecimal(value, container.codingPath)
	}
					self.currencyCode = try container.decode(CurrencyCode.self, forKey: .currencyCode)
			}
			public func encode(to encoder: Encoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				var container = encoder.container(keyedBy: CodingKeys.self)
				try container.encode(__typename, forKey: .__typename)
			try customScalarResolver.encode(amount, rawValueType: String.self, forKey: .amount, container: &container) { [codingPath = container.codingPath] (value) -> String in
				return try customScalarResolver.encoderForDecimal(value, codingPath)
			}
			try container.encode(currencyCode, forKey: .currencyCode)
			}
		public init(amount: NSDecimalNumber, currencyCode: CurrencyCode) {
				self.amount = amount
				self.currencyCode = currencyCode
				self.__typename = "MoneyV2"
		}
	}
}
public struct BaseAppPurchase: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The date and time when the app purchase was created.
		public var createdAt: Date
		/// The amount to be charged to the store for the app purchase.
		public var price: Price
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(createdAt: Date, price: Price) {
			self.createdAt = createdAt
			self.price = price
			self.__typename = "AppPurchase"
	}
		// MARK: - Nested Types
			public struct Price: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Decimal money amount.
			public var amount: NSDecimalNumber
			/// Currency of the money.
			public var currencyCode: CurrencyCode
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case amount
					case currencyCode
			}
			public init(from decoder: Decoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.amount = try customScalarResolver.decode(NSDecimalNumber.self, rawValueType: String.self, forKey: .amount, container: container) { (value) -> NSDecimalNumber in
	return try customScalarResolver.decoderForDecimal(value, container.codingPath)
	}
					self.currencyCode = try container.decode(CurrencyCode.self, forKey: .currencyCode)
			}
			public func encode(to encoder: Encoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				var container = encoder.container(keyedBy: CodingKeys.self)
				try container.encode(__typename, forKey: .__typename)
			try customScalarResolver.encode(amount, rawValueType: String.self, forKey: .amount, container: &container) { [codingPath = container.codingPath] (value) -> String in
				return try customScalarResolver.encoderForDecimal(value, codingPath)
			}
			try container.encode(currencyCode, forKey: .currencyCode)
			}
		public init(amount: NSDecimalNumber, currencyCode: CurrencyCode) {
				self.amount = amount
				self.currencyCode = currencyCode
				self.__typename = "MoneyV2"
		}
	}
}
}
}


extension MerchantApi.DuplicateFieldsOnInterface {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "DuplicateFieldsOnInterface",
    typeCondition: .interface("AppPurchase"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("AppPurchase"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "createdAt", alias: nil
, arguments: 
  []
, parentType: .interface("AppPurchase"), type: .scalar("DateTime"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "price", alias: nil
, arguments: 
  []
, parentType: .interface("AppPurchase"), type: .object("MoneyV2"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "amount", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("Decimal"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "currencyCode", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("CurrencyCode"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("AppPurchaseOneTime")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("AppPurchaseOneTime"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "createdAt", alias: nil
, arguments: 
  []
, parentType: .object("AppPurchaseOneTime"), type: .scalar("DateTime"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "price", alias: nil
, arguments: 
  []
, parentType: .object("AppPurchaseOneTime"), type: .object("MoneyV2"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "amount", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("Decimal"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "currencyCode", alias: nil
, arguments: 
  []
, parentType: .object("MoneyV2"), type: .scalar("CurrencyCode"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "returnUrl", alias: nil
, arguments: 
  []
, parentType: .object("AppPurchaseOneTime"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
