// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DeepMergeDuplicateFieldsResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns an Order resource by ID.
		public var order: Order?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(order: Order?) {
			self.order = order
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			@dynamicMemberLookup
	public struct Order: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.DeepMergeDuplicateFields, T>) -> T {
				get { asDeepMergeDuplicateFieldsFragment[keyPath: keyPath] }
				set { asDeepMergeDuplicateFieldsFragment[keyPath: keyPath] = newValue }
			}
			public var asDeepMergeDuplicateFieldsFragment: MerchantApi.DeepMergeDuplicateFields
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case asDeepMergeDuplicateFieldsFragment = "fragment:asDeepMergeDuplicateFieldsFragment"
			}
			public init(from decoder: Decoder) throws {
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					do {
						self.asDeepMergeDuplicateFieldsFragment = try MerchantApi.DeepMergeDuplicateFields(from: decoder)
					} catch let originalError {
						do {
							self.asDeepMergeDuplicateFieldsFragment = try container.decode(MerchantApi.DeepMergeDuplicateFields.self, forKey: .asDeepMergeDuplicateFieldsFragment)
						} catch {
								throw originalError
						}
					}
			}
		public init(deepMergeDuplicateFieldsFragment: MerchantApi.DeepMergeDuplicateFields) {
				self.asDeepMergeDuplicateFieldsFragment = deepMergeDuplicateFieldsFragment
				self.__typename = "Order"
		}
	}
}
}
