// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct Subscription1Response: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		public var presenceChanged: Bool

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(presenceChanged: Bool) {
			self.presenceChanged = presenceChanged
			self.__typename = "Subscription"
	}

}
}
