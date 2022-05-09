// Syrup auto-generated file
import Foundation

public extension MerchantApi {
		/// Specifies the information to be updated on the requested order.
	final class OrderInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var email: Input<String>
			public var id: GraphID
			public var note: Input<String>
			public var tags: Input<[String]>
			public var shippingAddress: Input<MailingAddressInput>
			public var customAttributes: Input<[AttributeInput]>
			public var metafields: Input<[MetafieldInput]>
			public var privateMetafields: Input<[PrivateMetafieldInput]>

		// MARK: - Initializer
		public init(email: Input<String> = .undefined, id: GraphID, note: Input<String> = .undefined, tags: Input<[String]> = .undefined, shippingAddress: Input<MailingAddressInput> = .undefined, customAttributes: Input<[AttributeInput]> = .undefined, metafields: Input<[MetafieldInput]> = .undefined, privateMetafields: Input<[PrivateMetafieldInput]> = .undefined) {
			self.email = email
			self.id = id
			self.note = note
			self.tags = tags
			self.shippingAddress = shippingAddress
			self.customAttributes = customAttributes
			self.metafields = metafields
			self.privateMetafields = privateMetafields
		}

		enum CodingKeys: String, CodingKey {
				case email
				case id
				case note
				case tags
				case shippingAddress
				case customAttributes
				case metafields
				case privateMetafields
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

	if case .value(let email) = email {
		try container.encode(email, forKey: .email)
	}

		try container.encode(id, forKey: .id)

	if case .value(let note) = note {
		try container.encode(note, forKey: .note)
	}

	if case .value(let tags) = tags {
		try container.encode(tags, forKey: .tags)
	}

	if case .value(let shippingAddress) = shippingAddress {
		try container.encode(shippingAddress, forKey: .shippingAddress)
	}

	if case .value(let customAttributes) = customAttributes {
		try container.encode(customAttributes, forKey: .customAttributes)
	}

	if case .value(let metafields) = metafields {
		try container.encode(metafields, forKey: .metafields)
	}

	if case .value(let privateMetafields) = privateMetafields {
		try container.encode(privateMetafields, forKey: .privateMetafields)
	}
		}

		public static func ==(lhs: OrderInput, rhs: OrderInput) -> Bool {
					return lhs.email == rhs.email
					&& lhs.id == rhs.id
					&& lhs.note == rhs.note
					&& lhs.tags == rhs.tags
					&& lhs.shippingAddress == rhs.shippingAddress
					&& lhs.customAttributes == rhs.customAttributes
					&& lhs.metafields == rhs.metafields
					&& lhs.privateMetafields == rhs.privateMetafields
		}
	}
}
