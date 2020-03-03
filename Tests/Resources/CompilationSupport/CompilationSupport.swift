import Foundation

public extension GraphApiQuery {
	static var errorLogger: GraphApiLogger? {
		return nil
	}
}

public extension GraphApiResponse {
	static var errorLogger: GraphApiLogger? {
		return nil
	}
}

public extension MerchantApi {
	static var customDecoder: JSONDecoder {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		return decoder
	}
	
	static var customEncoder: JSONEncoder {
		let encoder = JSONEncoder()
		encoder.dateEncodingStrategy = .iso8601
		return encoder
	}

	static var customScalarResolver: MerchantApi.CustomScalarResolver {
		let uint64Resolver = UInt64Resolver()
		let decimalResolver = DecimalResolver()
		return MerchantApi.CustomScalarResolver(decoderForUnsignedInt64: uint64Resolver.decoder, encoderForUnsignedInt64: uint64Resolver.encoder, decoderForDecimal: decimalResolver.decoder, encoderForDecimal: decimalResolver.encoder)
	}
}

private struct UInt64Resolver {
	var decoder: (String) throws -> UInt64 = { stringValue in
		guard let value = UInt64(stringValue) else {
			throw BaseCustomScalarResolver.ResolverError(type: UInt64.self)
		}
		return value
	}
	
	var encoder: (UInt64) throws -> String = { value in
		return String(value)
	}
}

private struct DecimalResolver {
	var decoder: (String) throws -> NSDecimalNumber = { _ in
		return NSDecimalNumber.zero
	}

	var encoder: (NSDecimalNumber) throws -> String = { _ in
		return ""
	}
}

public struct Money: Codable, Equatable {
	
}
