// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct InterfaceFragmentWithNestedFragmentResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Lookup a publication by ID.
		public var publication: Publication?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(publication: Publication?) {
			self.publication = publication
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct Publication: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The collection publications for the list of collections published to the publication.
			public var collectionPublicationsV3: CollectionPublicationsV3
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(collectionPublicationsV3: CollectionPublicationsV3) {
				self.collectionPublicationsV3 = collectionPublicationsV3
				self.__typename = "Publication"
		}
			// MARK: - Nested Types
				public struct CollectionPublicationsV3: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// A list of edges.
				public var edges: [Edges]
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(edges: [Edges]) {
					self.edges = edges
					self.__typename = "ResourcePublicationConnection"
			}
				// MARK: - Nested Types
					public struct Edges: GraphApiResponse, Equatable {
				// MARK: - Response Fields
					/// The item at the end of ResourcePublicationEdge.
					public var node: Node
				// MARK: - Helpers
				public let __typename: String
				public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
				public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
				public init(node: Node) {
						self.node = node
						self.__typename = "ResourcePublicationEdge"
				}
					// MARK: - Nested Types
						public struct Node: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						/// The resource published to the publication.
						public var publishable: Publishable
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
					public init(publishable: Publishable) {
							self.publishable = publishable
							self.__typename = "ResourcePublication"
					}
						// MARK: - Nested Types
				public struct Publishable: GraphApiResponse, Equatable {
					public var realized: Realized
					private var common: BasePublishable
					public var __typename: String
						/// The number of publications a resource is published to without feedback errors.
						public var availablePublicationCount: Int32 {
							return common.asInterfaceFragmentWithNestedFragmentFragment.availablePublicationCount
						}
						/// The list of resources that are published to a publication.
						public var resourcePublications: MerchantApi.InterfaceFragmentWithNestedFragment.ResourcePublications {
							return common.asInterfaceFragmentWithNestedFragmentFragment.resourcePublications
						}
						public var asInterfaceFragmentWithNestedFragmentFragment: MerchantApi.InterfaceFragmentWithNestedFragment {
							return common.asInterfaceFragmentWithNestedFragmentFragment
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
					public init(__typename: String, realized: Realized, interfaceFragmentWithNestedFragmentFragment: MerchantApi.InterfaceFragmentWithNestedFragment) {
						self.__typename = __typename
						self.realized = realized
						self.common = BasePublishable(interfaceFragmentWithNestedFragmentFragment: interfaceFragmentWithNestedFragmentFragment)
					}
				@dynamicMemberLookup
				public struct BasePublishable: GraphApiResponse, Equatable {
					// MARK: - Response Fields
						public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.InterfaceFragmentWithNestedFragment, T>) -> T {
							get { asInterfaceFragmentWithNestedFragmentFragment[keyPath: keyPath] }
							set { asInterfaceFragmentWithNestedFragmentFragment[keyPath: keyPath] = newValue }
						}
						public var asInterfaceFragmentWithNestedFragmentFragment: MerchantApi.InterfaceFragmentWithNestedFragment
					// MARK: - Helpers
					public let __typename: String
					public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
					public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
						private enum CodingKeys: String, CodingKey {
							case __typename
								case asInterfaceFragmentWithNestedFragmentFragment = "fragment:asInterfaceFragmentWithNestedFragmentFragment"
						}
						public init(from decoder: Decoder) throws {
							let container = try decoder.container(keyedBy: CodingKeys.self)
							self.__typename = try container.decode(String.self, forKey: .__typename)
								do {
									self.asInterfaceFragmentWithNestedFragmentFragment = try MerchantApi.InterfaceFragmentWithNestedFragment(from: decoder)
								} catch let originalError {
									do {
										self.asInterfaceFragmentWithNestedFragmentFragment = try container.decode(MerchantApi.InterfaceFragmentWithNestedFragment.self, forKey: .asInterfaceFragmentWithNestedFragmentFragment)
									} catch {
											throw originalError
									}
								}
						}
					public init(interfaceFragmentWithNestedFragmentFragment: MerchantApi.InterfaceFragmentWithNestedFragment) {
							self.asInterfaceFragmentWithNestedFragmentFragment = interfaceFragmentWithNestedFragmentFragment
							self.__typename = "Publishable"
					}
				}
				}
				}
			}
		}
	}
}
}
