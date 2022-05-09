// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct ChannelDetailsResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns a specific node by ID.
		public var node: Node?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(node: Node?) {
			self.node = node
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
public struct Node: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BaseNode
	public var __typename: String
	public enum Realized: Equatable {
			case app(App)
		case base(BaseNode)
	}
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	private enum CodingKeys: String, CodingKey {
		case __typename = "__typename"
	}
	public init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		self.__typename = try container.decode(String.self, forKey: .__typename)
		switch __typename {
			case "App":
				self.realized = .app(try App(from: decoder))
		default:
			self.realized = .base(try BaseNode(from: decoder))
		}
		self.common = try BaseNode(from: decoder)
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
			case .app(let value):
				try value.encode(to: encoder)
		case .base(let value):
			try value.encode(to: encoder)
		}
	}
	public init(__typename: String, realized: Realized) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseNode()
	}
public struct App: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Requirements that must be met before the app can be installed.
		public var failedRequirements: [MerchantApi.ChannelDetailsFields.FailedRequirements] {
			get {
				return asChannelDetailsFieldsFragment.failedRequirements
			}
			set {
				asChannelDetailsFieldsFragment.failedRequirements = newValue
			}
		}
		/// Screenshots of the app.
		public var screenshots: [MerchantApi.ChannelDetailsFields.Screenshots] {
			get {
				return asChannelDetailsFieldsFragment.screenshots
			}
			set {
				asChannelDetailsFieldsFragment.screenshots = newValue
			}
		}
		/// Icon that represents the app.
		public var icon: MerchantApi.ChannelDetailsFields.Icon {
			get {
				return asChannelDetailsFieldsFragment.icon
			}
			set {
				asChannelDetailsFieldsFragment.icon = newValue
			}
		}
		/// Name of the app.
		public var title: String {
			get {
				return asChannelDetailsFieldsFragment.title
			}
			set {
				asChannelDetailsFieldsFragment.title = newValue
			}
		}
		/// Detailed information about the app pricing.
		public var pricingDetails: String? {
			get {
				return asChannelDetailsFieldsFragment.pricingDetails
			}
			set {
				asChannelDetailsFieldsFragment.pricingDetails = newValue
			}
		}
		/// Summary of the app pricing details.
		public var pricingDetailsSummary: String {
			get {
				return asChannelDetailsFieldsFragment.pricingDetailsSummary
			}
			set {
				asChannelDetailsFieldsFragment.pricingDetailsSummary = newValue
			}
		}
		/// Description of the app.
		public var description: String? {
			get {
				return asChannelDetailsFieldsFragment.description
			}
			set {
				asChannelDetailsFieldsFragment.description = newValue
			}
		}
		/// List of app features.
		public var features: [String] {
			get {
				return asChannelDetailsFieldsFragment.features
			}
			set {
				asChannelDetailsFieldsFragment.features = newValue
			}
		}
		/// Webpage where you can install the app.
		public var installUrl: URL? {
			get {
				return asChannelDetailsFieldsFragment.installUrl
			}
			set {
				asChannelDetailsFieldsFragment.installUrl = newValue
			}
		}
		public var asChannelDetailsFieldsFragment: MerchantApi.ChannelDetailsFields
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		private enum CodingKeys: String, CodingKey {
			case __typename
				case asChannelDetailsFieldsFragment = "fragment:asChannelDetailsFieldsFragment"
		}
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				do {
					self.asChannelDetailsFieldsFragment = try MerchantApi.ChannelDetailsFields(from: decoder)
				} catch let originalError {
					do {
						self.asChannelDetailsFieldsFragment = try container.decode(MerchantApi.ChannelDetailsFields.self, forKey: .asChannelDetailsFieldsFragment)
					} catch {
							throw originalError
					}
				}
		}
	public init(channelDetailsFieldsFragment: MerchantApi.ChannelDetailsFields) {
			self.asChannelDetailsFieldsFragment = channelDetailsFieldsFragment
			self.__typename = "App"
	}
}
public struct BaseNode: GraphApiResponse, Equatable {
	// MARK: - Response Fields
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init() {
			self.__typename = "Node"
	}
}
}
}
}
