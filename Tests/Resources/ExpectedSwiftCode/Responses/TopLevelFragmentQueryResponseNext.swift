// Syrup auto-generated file
import Foundation

public extension MerchantApi {
@dynamicMemberLookup

struct TopLevelFragmentQueryResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields

		public subscript<T>(dynamicMember keyPath: WritableKeyPath<MerchantApi.TopLevelFragment, T>) -> T {
			get { asTopLevelFragmentFragment[keyPath: keyPath] }
			set { asTopLevelFragmentFragment[keyPath: keyPath] = newValue }
		}

		public var asTopLevelFragmentFragment: MerchantApi.TopLevelFragment

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

		private enum CodingKeys: String, CodingKey {
			case __typename
				case asTopLevelFragmentFragment = "fragment:asTopLevelFragmentFragment"
		}

		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				do {
					self.asTopLevelFragmentFragment = try MerchantApi.TopLevelFragment(from: decoder)
				} catch let originalError {
					do {
						self.asTopLevelFragmentFragment = try container.decode(MerchantApi.TopLevelFragment.self, forKey: .asTopLevelFragmentFragment)
					} catch {
							throw originalError
					}
				}
		}

	public init(topLevelFragmentFragment: MerchantApi.TopLevelFragment) {
			self.asTopLevelFragmentFragment = topLevelFragmentFragment
			self.__typename = "QueryRoot"
	}

}
}
