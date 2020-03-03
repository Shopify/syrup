// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	final class MetafieldInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var description: Input<String>
			public var id: Input<GraphID>
			public var key: Input<String>
			public var namespace: Input<String>
			public var value: Input<String>
			public var valueType: Input<MetafieldValueType>

		// MARK: - Initializer
		public init(description: Input<String> = .undefined, id: Input<GraphID> = .undefined, key: Input<String> = .undefined, namespace: Input<String> = .undefined, value: Input<String> = .undefined, valueType: Input<MetafieldValueType> = .undefined) {
			self.description = description
			self.id = id
			self.key = key
			self.namespace = namespace
			self.value = value
			self.valueType = valueType
		}

		enum CodingKeys: String, CodingKey {
				case description
				case id
				case key
				case namespace
				case value
				case valueType
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

	if case .value(let description) = description {
		try container.encode(description, forKey: .description)
	}

	if case .value(let id) = id {
		try container.encode(id, forKey: .id)
	}

	if case .value(let key) = key {
		try container.encode(key, forKey: .key)
	}

	if case .value(let namespace) = namespace {
		try container.encode(namespace, forKey: .namespace)
	}

	if case .value(let value) = value {
		try container.encode(value, forKey: .value)
	}

	if case .value(let valueType) = valueType {
		try container.encode(valueType, forKey: .valueType)
	}
		}

		public static func ==(lhs: MetafieldInput, rhs: MetafieldInput) -> Bool {
					return lhs.description == rhs.description
					&& lhs.id == rhs.id
					&& lhs.key == rhs.key
					&& lhs.namespace == rhs.namespace
					&& lhs.value == rhs.value
					&& lhs.valueType == rhs.valueType
		}
	}
}
