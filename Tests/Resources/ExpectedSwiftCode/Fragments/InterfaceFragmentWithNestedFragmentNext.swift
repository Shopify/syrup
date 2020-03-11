// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct InterfaceFragmentWithNestedFragment: GraphApiResponse, Equatable {
	public var realized: Realized
	private var common: BasePublishable
	public var __typename: String

	// MARK: - Common Fields
		/// The number of publications a resource is published to without feedback errors.
		public var availablePublicationCount: Int32 {
			get {
				return common.availablePublicationCount
			}
			set {
				common.availablePublicationCount = newValue
			}
		}
		public typealias ResourcePublications = BasePublishable.ResourcePublications
		/// The list of resources that are published to a publication.
		public var resourcePublications: ResourcePublications {
			get {
				return common.resourcePublications
			}
			set {
				common.resourcePublications = newValue
			}
		}

	public enum Realized: Equatable {
		case base(BasePublishable)
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
		default:
			self.realized = .base(try BasePublishable(from: decoder))
		}
		self.common = try BasePublishable(from: decoder)
	}

	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
		case .base(let value):
			try value.encode(to: encoder)
		}
	}

	public init(__typename: String, realized: Realized, availablePublicationCount: Int32, resourcePublications: ResourcePublications) {
		self.__typename = __typename
		self.realized = realized
		self.common = BasePublishable(availablePublicationCount: availablePublicationCount, resourcePublications: resourcePublications)
	}

public struct BasePublishable: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// The number of publications a resource is published to without feedback errors.
		public var availablePublicationCount: Int32
		/// The list of resources that are published to a publication.
		public var resourcePublications: ResourcePublications
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
	public init(availablePublicationCount: Int32, resourcePublications: ResourcePublications) {
			self.availablePublicationCount = availablePublicationCount
			self.resourcePublications = resourcePublications
			self.__typename = "Publishable"
	}
		// MARK: - Nested Types
			@dynamicMemberLookup
	public struct ResourcePublications: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.Publications, T>) -> T {
				get { asPublicationsFragment[keyPath: keyPath] }
				set { asPublicationsFragment[keyPath: keyPath] = newValue }
			}
			public var asPublicationsFragment: MerchantApi.Publications
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case asPublicationsFragment = "fragment:asPublicationsFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					do {
						self.asPublicationsFragment = try MerchantApi.Publications(from: decoder)
					} catch let originalError {
						do {
							self.asPublicationsFragment = try container.decode(MerchantApi.Publications.self, forKey: .asPublicationsFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(publicationsFragment: MerchantApi.Publications) {
				self.asPublicationsFragment = publicationsFragment
				self.__typename = "ResourcePublicationConnection"
		}
	}
}
}
}


extension MerchantApi.InterfaceFragmentWithNestedFragment {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "InterfaceFragmentWithNestedFragment",
    typeCondition: .interface("Publishable"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .interface("Publishable"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "availablePublicationCount", alias: nil
, arguments: 
  []
, parentType: .interface("Publishable"), type: .scalar("Int"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "resourcePublications", alias: nil
, arguments: 
  []
, parentType: .interface("Publishable"), type: .object("ResourcePublicationConnection"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("ResourcePublicationConnection"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .fragmentSpread(MerchantApi.Publications.fragmentSpread
)
  ]
  ))
  ]
  )
}
