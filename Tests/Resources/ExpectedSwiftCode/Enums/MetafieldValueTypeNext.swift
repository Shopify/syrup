// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	enum MetafieldValueType: String, Codable, CaseIterable {
		/// A string.
			case string = "STRING"
		/// An integer.
			case integer = "INTEGER"
		/// A JSON string.
			case jsonString = "JSON_STRING"
		case unknownValue = ""

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			if let value = MetafieldValueType(rawValue: stringValue) {
				self = value
			} else {
				self = .unknownValue
			}
		}

		public static var allCases: [MetafieldValueType] = [
			.string,
			.integer,
			.jsonString,
		]
	}
}
