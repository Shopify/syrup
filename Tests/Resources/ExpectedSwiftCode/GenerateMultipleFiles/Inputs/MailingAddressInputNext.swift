// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	final class MailingAddressInput: Encodable, Equatable {
		// MARK: - Input Fields
			public var address1: Input<String>
			public var address2: Input<String>
			public var city: Input<String>
			public var company: Input<String>
			public var country: Input<String>
			public var countryCode: Input<CountryCode>
			public var firstName: Input<String>
			public var id: Input<GraphID>
			public var lastName: Input<String>
			public var phone: Input<String>
			public var province: Input<String>
			public var provinceCode: Input<String>
			public var zip: Input<String>

		// MARK: - Initializer
		public init(address1: Input<String> = .undefined, address2: Input<String> = .undefined, city: Input<String> = .undefined, company: Input<String> = .undefined, country: Input<String> = .undefined, countryCode: Input<CountryCode> = .undefined, firstName: Input<String> = .undefined, id: Input<GraphID> = .undefined, lastName: Input<String> = .undefined, phone: Input<String> = .undefined, province: Input<String> = .undefined, provinceCode: Input<String> = .undefined, zip: Input<String> = .undefined) {
			self.address1 = address1
			self.address2 = address2
			self.city = city
			self.company = company
			self.country = country
			self.countryCode = countryCode
			self.firstName = firstName
			self.id = id
			self.lastName = lastName
			self.phone = phone
			self.province = province
			self.provinceCode = provinceCode
			self.zip = zip
		}

		enum CodingKeys: String, CodingKey {
				case address1
				case address2
				case city
				case company
				case country
				case countryCode
				case firstName
				case id
				case lastName
				case phone
				case province
				case provinceCode
				case zip
		}

		public func encode(to encoder: Encoder) throws {
			var container = encoder.container(keyedBy: CodingKeys.self)

	if case .value(let address1) = address1 {
		try container.encode(address1, forKey: .address1)
	}

	if case .value(let address2) = address2 {
		try container.encode(address2, forKey: .address2)
	}

	if case .value(let city) = city {
		try container.encode(city, forKey: .city)
	}

	if case .value(let company) = company {
		try container.encode(company, forKey: .company)
	}

	if case .value(let country) = country {
		try container.encode(country, forKey: .country)
	}

	if case .value(let countryCode) = countryCode {
		try container.encode(countryCode, forKey: .countryCode)
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

	if case .value(let phone) = phone {
		try container.encode(phone, forKey: .phone)
	}

	if case .value(let province) = province {
		try container.encode(province, forKey: .province)
	}

	if case .value(let provinceCode) = provinceCode {
		try container.encode(provinceCode, forKey: .provinceCode)
	}

	if case .value(let zip) = zip {
		try container.encode(zip, forKey: .zip)
	}
		}

		public static func ==(lhs: MailingAddressInput, rhs: MailingAddressInput) -> Bool {
					return lhs.address1 == rhs.address1
					&& lhs.address2 == rhs.address2
					&& lhs.city == rhs.city
					&& lhs.company == rhs.company
					&& lhs.country == rhs.country
					&& lhs.countryCode == rhs.countryCode
					&& lhs.firstName == rhs.firstName
					&& lhs.id == rhs.id
					&& lhs.lastName == rhs.lastName
					&& lhs.phone == rhs.phone
					&& lhs.province == rhs.province
					&& lhs.provinceCode == rhs.provinceCode
					&& lhs.zip == rhs.zip
		}
	}
}
