// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct CommonFieldsWithUnionTypes: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BaseDiscountApplication
	public var __typename: String

	// MARK: - Common Fields
		public typealias Value = BaseDiscountApplication.Value
		/// The value of the discount application.
		public var value: Value {
			get {
				return common.value
			}
			set {
				common.value = newValue
			}
		}

	public enum Realized: Equatable {
			case discountCodeApplication(DiscountCodeApplication)
		case base(BaseDiscountApplication)
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
			case "DiscountCodeApplication":
				self.realized = .discountCodeApplication(try DiscountCodeApplication(from: decoder))
		default:
			self.realized = .base(try BaseDiscountApplication(from: decoder))
		}
		self.common = try BaseDiscountApplication(from: decoder)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .discountCodeApplication(let value):
				try value.encode(to: encoder)
		case .base(let value):
			try value.encode(to: encoder)
		}
	}

	public init(__typename: String, realized: Realized, value: Value) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseDiscountApplication(value: value)
	}

public struct DiscountCodeApplication: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The value of the discount application.
		public var value: Value
		/// The string identifying the discount code that was used at the time of application.
		public var code: String
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(value: Value, code: String) {
			self.value = value
			self.code = code
			self.__typename = "DiscountCodeApplication"
	}
		// MARK: - Nested Types
public struct Value: GraphApiResponse, Equatable {
	public var realized: Realized
	public var __typename: String
	public enum Realized: Equatable {
			case moneyV2(MoneyV2)
			case pricingPercentageValue(PricingPercentageValue)
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
			case "MoneyV2":
				self.realized = .moneyV2(try MoneyV2(from: decoder))
			case "PricingPercentageValue":
				self.realized = .pricingPercentageValue(try PricingPercentageValue(from: decoder))
		default:
			self.realized = .unknown
		}
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .moneyV2(let value):
				try value.encode(to: encoder)
			case .pricingPercentageValue(let value):
				try value.encode(to: encoder)
		case .unknown:
			break
		}
	}
	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
	}
public struct MoneyV2: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Decimal money amount.
		public var amount: NSDecimalNumber
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		private enum CodingKeys: String, CodingKey {
			case __typename
				case amount
		}
		public init(from decoder: Decoder) throws {
			let customScalarResolver = MerchantApi.customScalarResolver
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				self.amount = try customScalarResolver.decode(NSDecimalNumber.self, rawValueType: String.self, forKey: .amount, container: container) { (value) -> NSDecimalNumber in
return try customScalarResolver.decoderForDecimal(value, container.codingPath)
}
		}
		public func encode(to encoder: Encoder) throws {
			let customScalarResolver = MerchantApi.customScalarResolver
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(__typename, forKey: .__typename)
		try customScalarResolver.encode(amount, rawValueType: String.self, forKey: .amount, container: &container) { [codingPath = container.codingPath] (value) -> String in
			return try customScalarResolver.encoderForDecimal(value, codingPath)
		}
		}
	public init(amount: NSDecimalNumber) {
			self.amount = amount
			self.__typename = "MoneyV2"
	}
}
public struct PricingPercentageValue: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The percentage value of the object.
		public var percentage: Double
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(percentage: Double) {
			self.percentage = percentage
			self.__typename = "PricingPercentageValue"
	}
}
}
}
public struct BaseDiscountApplication: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The value of the discount application.
		public var value: Value
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(value: Value) {
			self.value = value
			self.__typename = "DiscountApplication"
	}
		// MARK: - Nested Types
public struct Value: GraphApiResponse, Equatable {
	public var realized: Realized
	public var __typename: String
	public enum Realized: Equatable {
			case moneyV2(MoneyV2)
			case pricingPercentageValue(PricingPercentageValue)
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
			case "MoneyV2":
				self.realized = .moneyV2(try MoneyV2(from: decoder))
			case "PricingPercentageValue":
				self.realized = .pricingPercentageValue(try PricingPercentageValue(from: decoder))
		default:
			self.realized = .unknown
		}
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .moneyV2(let value):
				try value.encode(to: encoder)
			case .pricingPercentageValue(let value):
				try value.encode(to: encoder)
		case .unknown:
			break
		}
	}
	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
	}
public struct MoneyV2: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Decimal money amount.
		public var amount: NSDecimalNumber
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		private enum CodingKeys: String, CodingKey {
			case __typename
				case amount
		}
		public init(from decoder: Decoder) throws {
			let customScalarResolver = MerchantApi.customScalarResolver
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				self.amount = try customScalarResolver.decode(NSDecimalNumber.self, rawValueType: String.self, forKey: .amount, container: container) { (value) -> NSDecimalNumber in
return try customScalarResolver.decoderForDecimal(value, container.codingPath)
}
		}
		public func encode(to encoder: Encoder) throws {
			let customScalarResolver = MerchantApi.customScalarResolver
			var container = encoder.container(keyedBy: CodingKeys.self)
			try container.encode(__typename, forKey: .__typename)
		try customScalarResolver.encode(amount, rawValueType: String.self, forKey: .amount, container: &container) { [codingPath = container.codingPath] (value) -> String in
			return try customScalarResolver.encoderForDecimal(value, codingPath)
		}
		}
	public init(amount: NSDecimalNumber) {
			self.amount = amount
			self.__typename = "MoneyV2"
	}
}
public struct PricingPercentageValue: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The percentage value of the object.
		public var percentage: Double
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(percentage: Double) {
			self.percentage = percentage
			self.__typename = "PricingPercentageValue"
	}
}
}
}
}
}


extension MerchantApi.CommonFieldsWithUnionTypes {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "CommonFieldsWithUnionTypes",
    typeCondition: .interface("DiscountApplication"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("DiscountApplication"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "value", alias: nil
, arguments: 
  []
, parentType: .interface("DiscountApplication"), type: .union("PricingValue"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("PricingValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("PricingPercentageValue")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PricingPercentageValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "percentage", alias: nil
, arguments: 
  []
, parentType: .object("PricingPercentageValue"), type: .scalar("Float"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("MoneyV2")
, selectionSet: 
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
  ]
  ))
  ]
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("DiscountCodeApplication")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeApplication"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "code", alias: nil
, arguments: 
  []
, parentType: .object("DiscountCodeApplication"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
