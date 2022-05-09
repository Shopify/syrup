// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	final class PrivateMetafieldInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var owner: Input<GraphID>
			public var namespace: String
			public var key: String
			public var valueInput: PrivateMetafieldValueInput

		// MARK: - Initializer
		public init(owner: Input<GraphID> = .undefined, namespace: String, key: String, valueInput: PrivateMetafieldValueInput) {
			self.owner = owner
			self.namespace = namespace
			self.key = key
			self.valueInput = valueInput
		}

		enum CodingKeys: String, CodingKey {
				case owner
				case namespace
				case key
				case valueInput
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

	if case .value(let owner) = owner {
		try container.encode(owner, forKey: .owner)
	}

		try container.encode(namespace, forKey: .namespace)

		try container.encode(key, forKey: .key)

		try container.encode(valueInput, forKey: .valueInput)
		}

		public static func ==(lhs: PrivateMetafieldInput, rhs: PrivateMetafieldInput) -> Bool {
					return lhs.owner == rhs.owner
					&& lhs.namespace == rhs.namespace
					&& lhs.key == rhs.key
					&& lhs.valueInput == rhs.valueInput
		}
	}
}
