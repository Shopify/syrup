// Syrup auto-generated file
import Foundation

public extension MerchantApi {
		/// Provides the fields and values to use when creating or updating a customer.
	final class CustomerInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var acceptsMarketing: Input<Bool>
			public var acceptsMarketingUpdatedAt: Input<Date>
			public var addresses: Input<[MailingAddressInput]>
			public var email: Input<String>
			public var firstName: Input<String>
			public var id: Input<GraphID>
			public var lastName: Input<String>
			public var locale: Input<String>
			public var marketingOptInLevel: Input<CustomerMarketingOptInLevel>
			public var metafields: Input<[MetafieldInput]>
			public var note: Input<String>
			public var phone: Input<String>
			public var privateMetafields: Input<[PrivateMetafieldInput]>
			public var tags: Input<[String]>
			public var taxExempt: Input<Bool>
			public var taxExemptions: Input<[TaxExemption]>

		// MARK: - Initializer
		public init(acceptsMarketing: Input<Bool> = .undefined, acceptsMarketingUpdatedAt: Input<Date> = .undefined, addresses: Input<[MailingAddressInput]> = .undefined, email: Input<String> = .undefined, firstName: Input<String> = .undefined, id: Input<GraphID> = .undefined, lastName: Input<String> = .undefined, locale: Input<String> = .undefined, marketingOptInLevel: Input<CustomerMarketingOptInLevel> = .undefined, metafields: Input<[MetafieldInput]> = .undefined, note: Input<String> = .undefined, phone: Input<String> = .undefined, privateMetafields: Input<[PrivateMetafieldInput]> = .undefined, tags: Input<[String]> = .undefined, taxExempt: Input<Bool> = .undefined, taxExemptions: Input<[TaxExemption]> = .undefined) {
			self.acceptsMarketing = acceptsMarketing
			self.acceptsMarketingUpdatedAt = acceptsMarketingUpdatedAt
			self.addresses = addresses
			self.email = email
			self.firstName = firstName
			self.id = id
			self.lastName = lastName
			self.locale = locale
			self.marketingOptInLevel = marketingOptInLevel
			self.metafields = metafields
			self.note = note
			self.phone = phone
			self.privateMetafields = privateMetafields
			self.tags = tags
			self.taxExempt = taxExempt
			self.taxExemptions = taxExemptions
		}

		enum CodingKeys: String, CodingKey {
				case acceptsMarketing
				case acceptsMarketingUpdatedAt
				case addresses
				case email
				case firstName
				case id
				case lastName
				case locale
				case marketingOptInLevel
				case metafields
				case note
				case phone
				case privateMetafields
				case tags
				case taxExempt
				case taxExemptions
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

	if case .value(let acceptsMarketing) = acceptsMarketing {
		try container.encode(acceptsMarketing, forKey: .acceptsMarketing)
	}

	if case .value(let acceptsMarketingUpdatedAt) = acceptsMarketingUpdatedAt {
		try container.encode(acceptsMarketingUpdatedAt, forKey: .acceptsMarketingUpdatedAt)
	}

	if case .value(let addresses) = addresses {
		try container.encode(addresses, forKey: .addresses)
	}

	if case .value(let email) = email {
		try container.encode(email, forKey: .email)
	}

	if case .value(let firstName) = firstName {
		try container.encode(firstName, forKey: .firstName)
	}

	if case .value(let id) = id {
		try container.encode(id, forKey: .id)
	}

	if case .value(let lastName) = lastName {
		try container.encode(lastName, forKey: .lastName)
	}

	if case .value(let locale) = locale {
		try container.encode(locale, forKey: .locale)
	}

	if case .value(let marketingOptInLevel) = marketingOptInLevel {
		try container.encode(marketingOptInLevel, forKey: .marketingOptInLevel)
	}

	if case .value(let metafields) = metafields {
		try container.encode(metafields, forKey: .metafields)
	}

	if case .value(let note) = note {
		try container.encode(note, forKey: .note)
	}

	if case .value(let phone) = phone {
		try container.encode(phone, forKey: .phone)
	}

	if case .value(let privateMetafields) = privateMetafields {
		try container.encode(privateMetafields, forKey: .privateMetafields)
	}

	if case .value(let tags) = tags {
		try container.encode(tags, forKey: .tags)
	}

	if case .value(let taxExempt) = taxExempt {
		try container.encode(taxExempt, forKey: .taxExempt)
	}

	if case .value(let taxExemptions) = taxExemptions {
		try container.encode(taxExemptions, forKey: .taxExemptions)
	}
		}

		public static func ==(lhs: CustomerInput, rhs: CustomerInput) -> Bool {
					return lhs.acceptsMarketing == rhs.acceptsMarketing
					&& lhs.acceptsMarketingUpdatedAt == rhs.acceptsMarketingUpdatedAt
					&& lhs.addresses == rhs.addresses
					&& lhs.email == rhs.email
					&& lhs.firstName == rhs.firstName
					&& lhs.id == rhs.id
					&& lhs.lastName == rhs.lastName
					&& lhs.locale == rhs.locale
					&& lhs.marketingOptInLevel == rhs.marketingOptInLevel
					&& lhs.metafields == rhs.metafields
					&& lhs.note == rhs.note
					&& lhs.phone == rhs.phone
					&& lhs.privateMetafields == rhs.privateMetafields
					&& lhs.tags == rhs.tags
					&& lhs.taxExempt == rhs.taxExempt
					&& lhs.taxExemptions == rhs.taxExemptions
		}
	}
}
