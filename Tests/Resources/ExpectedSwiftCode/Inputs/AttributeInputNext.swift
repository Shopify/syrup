// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	final class AttributeInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var key: String
			public var value: String

		// MARK: - Initializer
		public init(key: String, value: String) {
			self.key = key
			self.value = value
		}

		enum CodingKeys: String, CodingKey {
				case key
				case value
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

		try container.encode(key, forKey: .key)

		try container.encode(value, forKey: .value)
		}

		public static func ==(lhs: AttributeInput, rhs: AttributeInput) -> Bool {
					return lhs.key == rhs.key
					&& lhs.value == rhs.value
		}
	}
}
