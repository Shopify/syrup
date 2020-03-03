// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	final class PrivateMetafieldValueInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var value: String
			public var valueType: PrivateMetafieldValueType

		// MARK: - Initializer
		public init(value: String, valueType: PrivateMetafieldValueType) {
			self.value = value
			self.valueType = valueType
		}

		enum CodingKeys: String, CodingKey {
				case value
				case valueType
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

		try container.encode(value, forKey: .value)

		try container.encode(valueType, forKey: .valueType)
		}

		public static func ==(lhs: PrivateMetafieldValueInput, rhs: PrivateMetafieldValueInput) -> Bool {
					return lhs.value == rhs.value
					&& lhs.valueType == rhs.valueType
		}
	}
}
