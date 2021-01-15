// Syrup auto-generated file
import Foundation

public extension MerchantApi {
	enum CustomerMarketingOptInLevel: String, Codable, CaseIterable {
		/// The customer started receiving marketing email(s) after providing their email address, without any
		/// intermediate steps.
			case singleOptIn = "SINGLE_OPT_IN"
		/// After providing their email address, the customer received a confirmation email which required them to
		/// perform a prescribed action before receiving marketing emails.
			case confirmedOptIn = "CONFIRMED_OPT_IN"
		/// The customer receives marketing emails, but the original opt-in process is unknown.
			case unknown = "UNKNOWN"
		case unknownValue = ""

		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			if let value = CustomerMarketingOptInLevel(rawValue: stringValue) {
				self = value
			} else {
				self = .unknownValue
			}
		}

		public static var allCases: [CustomerMarketingOptInLevel] = [
			.singleOptIn,
			.confirmedOptIn,
			.unknown,
		]
	}
}
