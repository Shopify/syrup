// Syrup auto-generated file
import Foundation

public extension MerchantApi {
class CustomScalarResolver: BaseCustomScalarResolver {
		public let decoderForUnsignedInt64: (String, [CodingKey]) throws -> UInt64
		public let encoderForUnsignedInt64: (UInt64, [CodingKey]) throws -> String
		public let decoderForDecimal: (String, [CodingKey]) throws -> NSDecimalNumber
		public let encoderForDecimal: (NSDecimalNumber, [CodingKey]) throws -> String

	init(decoderForUnsignedInt64: @escaping (String) throws -> UInt64, encoderForUnsignedInt64: @escaping (UInt64) throws -> String, decoderForDecimal: @escaping (String) throws -> NSDecimalNumber, encoderForDecimal: @escaping (NSDecimalNumber) throws -> String) {
			self.decoderForUnsignedInt64 = { rawValue, codingPath in
				try MerchantApi.CustomScalarResolver.performDecode(resolver: decoderForUnsignedInt64, rawValue: rawValue, codingPath: codingPath)
			}
			self.encoderForUnsignedInt64 = { value, codingPath in
				try MerchantApi.CustomScalarResolver.performEncode(resolver: encoderForUnsignedInt64, value: value, codingPath: codingPath)
			}
			self.decoderForDecimal = { rawValue, codingPath in
				try MerchantApi.CustomScalarResolver.performDecode(resolver: decoderForDecimal, rawValue: rawValue, codingPath: codingPath)
			}
			self.encoderForDecimal = { value, codingPath in
				try MerchantApi.CustomScalarResolver.performEncode(resolver: encoderForDecimal, value: value, codingPath: codingPath)
			}
		super.init()
	}

	private static func performDecode<T, R>(resolver: (R) throws -> T, rawValue: R, codingPath: [CodingKey]) throws -> T {
		do {
			return try resolver(rawValue)
		} catch is ResolverError {
			throw DecodingError.valueNotFound(T.self, DecodingError.Context(codingPath: codingPath, debugDescription: "Expected to find value for \(T.self), found nil instead."))
		}
	}

	private static func performEncode<T, R>(resolver: (T) throws -> R, value: T, codingPath: [CodingKey]) throws -> R {
		do {
			return try resolver(value)
		} catch is ResolverError {
			throw EncodingError.invalidValue(value, EncodingError.Context(codingPath: codingPath, debugDescription: "Unable to encode custom value \(value) to type \(T.self)"))
		}
	}
}
}
