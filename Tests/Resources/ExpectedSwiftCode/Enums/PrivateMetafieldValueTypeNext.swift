// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	enum PrivateMetafieldValueType: String, Codable, CaseIterable {
		/// A private metafield value type.
			case string = "STRING"
		/// A private metafield value type.
			case integer = "INTEGER"
		/// A private metafield value type.
			case jsonString = "JSON_STRING"
		case unknownValue = ""

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			if let value = PrivateMetafieldValueType(rawValue: stringValue) {
				self = value
			} else {
				self = .unknownValue
			}
		}

		public static var allCases: [PrivateMetafieldValueType] = [
			.string,
			.integer,
			.jsonString,
		]
	}
}
