// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct UnionFrag: GraphApiResponse, Equatable {
	public var realized: Realized
	public var __typename: String

	public enum Realized: Equatable {
			case priceRuleFixedAmountValue(PriceRuleFixedAmountValue)
			case priceRulePercentValue(PriceRulePercentValue)
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
			case "PriceRuleFixedAmountValue":
				self.realized = .priceRuleFixedAmountValue(try PriceRuleFixedAmountValue(from: decoder))
			case "PriceRulePercentValue":
				self.realized = .priceRulePercentValue(try PriceRulePercentValue(from: decoder))
		default:
			self.realized = .unknown
		}
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .priceRuleFixedAmountValue(let value):
				try value.encode(to: encoder)
			case .priceRulePercentValue(let value):
				try value.encode(to: encoder)
		case .unknown:
			break
		}
	}

	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
	}

public struct PriceRuleFixedAmountValue: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The monetary value of the price rule.
		public var amount: Money
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(amount: Money) {
			self.amount = amount
			self.__typename = "PriceRuleFixedAmountValue"
	}
}
public struct PriceRulePercentValue: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The percent value of the price rule.
		public var percentage: Double
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(percentage: Double) {
			self.percentage = percentage
			self.__typename = "PriceRulePercentValue"
	}
}
}
}


extension MerchantApi.UnionFrag {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "UnionFrag",
    typeCondition: .union("PriceRuleValue"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("PriceRuleValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .union("PriceRuleValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("PriceRulePercentValue")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PriceRulePercentValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "percentage", alias: nil
, arguments: 
  []
, parentType: .object("PriceRulePercentValue"), type: .scalar("Float"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .inlineFragment(GraphSelections.InlineFragment(typeCondition: .object("PriceRuleFixedAmountValue")
, selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("PriceRuleFixedAmountValue"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "amount", alias: nil
, arguments: 
  []
, parentType: .object("PriceRuleFixedAmountValue"), type: .scalar("Money"), selectionSet: 
  []
  ))
  ]
  ))
  ]
  )
}
