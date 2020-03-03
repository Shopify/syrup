// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct NullableCustomCodedScalarResponse: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Returns the current app's most recent BulkOperation.
		public var currentBulkOperation: CurrentBulkOperation?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(currentBulkOperation: CurrentBulkOperation?) {
			self.currentBulkOperation = currentBulkOperation
			self.__typename = "QueryRoot"
	}

		// MARK: - Nested Types
			public struct CurrentBulkOperation: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// File size in bytes of the file in the `url` field.
			public var fileSize: UInt64?
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			private enum CodingKeys: String, CodingKey {
				case __typename
					case fileSize
			}
			public init(from decoder: Decoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				let container = try decoder.container(keyedBy: CodingKeys.self)
				self.__typename = try container.decode(String.self, forKey: .__typename)
					self.fileSize = try customScalarResolver.decode(UInt64?.self, rawValueType: String.self, forKey: .fileSize, container: container) { (value) -> UInt64 in
	return try customScalarResolver.decoderForUnsignedInt64(value, container.codingPath)
	}
			}
			public func encode(to encoder: Encoder) throws {
				let customScalarResolver = MerchantApi.customScalarResolver
				var container = encoder.container(keyedBy: CodingKeys.self)
				try container.encode(__typename, forKey: .__typename)
			try customScalarResolver.encode(fileSize, rawValueType: String.self, forKey: .fileSize, container: &container) { [codingPath = container.codingPath] (value) -> String in
				return try customScalarResolver.encoderForUnsignedInt64(value, codingPath)
			}
			}
		public init(fileSize: UInt64?) {
				self.fileSize = fileSize
				self.__typename = "BulkOperation"
		}
	}
}
}
