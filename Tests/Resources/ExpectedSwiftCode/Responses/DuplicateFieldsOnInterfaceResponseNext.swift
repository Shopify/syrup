// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct DuplicateFieldsOnInterfaceResponse: GraphApiResponse, Equatable {
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
		public var asDuplicateFieldsOnInterfaceFragment: MerchantApi.DuplicateFieldsOnInterface? {
			return common.asDuplicateFieldsOnInterfaceFragment
		}
	public enum Realized: Equatable {
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
		default:
			self.realized = .base(try BaseNode(from: decoder))
		}
		self.common = try BaseNode(from: decoder)
	}
	public func encode(to encoder: Encoder) throws {
		var container = encoder.container(keyedBy: CodingKeys.self)
		try container.encode(__typename, forKey: .__typename)
		switch realized {
		case .base(let value):
			try value.encode(to: encoder)
		}
	}
	public init(__typename: String, realized: Realized, duplicateFieldsOnInterfaceFragment: MerchantApi.DuplicateFieldsOnInterface?) {
		self.__typename = __typename
		self.realized = realized
		self.common = BaseNode(duplicateFieldsOnInterfaceFragment: duplicateFieldsOnInterfaceFragment)
	}
public struct BaseNode: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		public var asDuplicateFieldsOnInterfaceFragment: MerchantApi.DuplicateFieldsOnInterface?
	// MARK: - Helpers
	public let __typename: String
	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		private enum CodingKeys: String, CodingKey {
			case __typename
				case asDuplicateFieldsOnInterfaceFragment = "fragment:asDuplicateFieldsOnInterfaceFragment"
		}
		public init(from decoder: Decoder) throws {
			let container = try decoder.container(keyedBy: CodingKeys.self)
			self.__typename = try container.decode(String.self, forKey: .__typename)
				do {
					self.asDuplicateFieldsOnInterfaceFragment = try MerchantApi.DuplicateFieldsOnInterface(from: decoder)
				} catch  {
					do {
						self.asDuplicateFieldsOnInterfaceFragment = try container.decode(MerchantApi.DuplicateFieldsOnInterface?.self, forKey: .asDuplicateFieldsOnInterfaceFragment)
					} catch {
							self.asDuplicateFieldsOnInterfaceFragment = nil
					}
				}
		}
	public init(duplicateFieldsOnInterfaceFragment: MerchantApi.DuplicateFieldsOnInterface?) {
			self.asDuplicateFieldsOnInterfaceFragment = duplicateFieldsOnInterfaceFragment
			self.__typename = "Node"
	}
}
}
}
}
