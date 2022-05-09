// Syrup auto-generated file
import Foundation

public extension MerchantApi {
struct ChannelDetailsFields: GraphApiResponse, Equatable {
	// MARK: - Response Fields
		/// Requirements that must be met before the app can be installed.
		public var failedRequirements: [FailedRequirements]
		/// Screenshots of the app.
		public var screenshots: [Screenshots]
		/// Icon that represents the app.
		public var icon: Icon
		/// Name of the app.
		public var title: String
		/// Detailed information about the app pricing.
		public var pricingDetails: String?
		/// Summary of the app pricing details.
		public var pricingDetailsSummary: String
		/// Description of the app.
		public var description: String?
		/// List of app features.
		public var features: [String]
		/// Webpage where you can install the app.
		public var installUrl: URL?

	// MARK: - Helpers
	public let __typename: String

	public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
	public static let customEncoder: JSONEncoder = MerchantApi.customEncoder

	public init(failedRequirements: [FailedRequirements], screenshots: [Screenshots], icon: Icon, title: String, pricingDetails: String?, pricingDetailsSummary: String, description: String?, features: [String], installUrl: URL?) {
			self.failedRequirements = failedRequirements
			self.screenshots = screenshots
			self.icon = icon
			self.title = title
			self.pricingDetails = pricingDetails
			self.pricingDetailsSummary = pricingDetailsSummary
			self.description = description
			self.features = features
			self.installUrl = installUrl
			self.__typename = "App"
	}

		// MARK: - Nested Types
			public struct FailedRequirements: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// Action to be taken to resolve a failed requirement, including URL link.
			public var action: Action?
			/// A concise set of copy strings to be displayed to merchants, to guide them in resolving problems your app
			/// encounters when trying to make use of their Shop and its resources.
			public var message: String
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(action: Action?, message: String) {
				self.action = action
				self.message = message
				self.__typename = "FailedRequirement"
		}
			// MARK: - Nested Types
				public struct Action: GraphApiResponse, Equatable {
			// MARK: - Response Fields
				/// The name of the navigation item.
				public var title: String
				/// The URL of the page that the navigation item links to.
				public var url: URL
			// MARK: - Helpers
			public let __typename: String
			public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
			public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
			public init(title: String, url: URL) {
					self.title = title
					self.url = url
					self.__typename = "NavigationItem"
			}
		}
	}
			public struct Screenshots: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The location of the transformed image as a URL.
			/// All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
			/// Otherwise any transformations which an image type does not support will be ignored.
			public var transformedSrc: URL
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(transformedSrc: URL) {
				self.transformedSrc = transformedSrc
				self.__typename = "Image"
		}
	}
			public struct Icon: GraphApiResponse, Equatable {
		// MARK: - Response Fields
			/// The location of the transformed image as a URL.
			/// All transformation arguments are considered "best-effort". If they can be applied to an image, they will be.
			/// Otherwise any transformations which an image type does not support will be ignored.
			public var transformedSrc: URL
		// MARK: - Helpers
		public let __typename: String
		public static let customDecoder: JSONDecoder = MerchantApi.customDecoder
		public static let customEncoder: JSONEncoder = MerchantApi.customEncoder
		public init(transformedSrc: URL) {
				self.transformedSrc = transformedSrc
				self.__typename = "Image"
		}
	}
}
}


extension MerchantApi.ChannelDetailsFields {
  static let fragmentSpread = GraphSelections.FragmentSpread(
    name: "ChannelDetailsFields",
    typeCondition: .object("App"),
    selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "failedRequirements", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .object("FailedRequirement"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("FailedRequirement"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "action", alias: nil
, arguments: 
  []
, parentType: .object("FailedRequirement"), type: .object("NavigationItem"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("NavigationItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "title", alias: nil
, arguments: 
  []
, parentType: .object("NavigationItem"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "url", alias: nil
, arguments: 
  []
, parentType: .object("NavigationItem"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "message", alias: nil
, arguments: 
  []
, parentType: .object("FailedRequirement"), type: .scalar("String"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "screenshots", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .object("Image"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Image"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "transformedSrc", alias: nil
, arguments: 
  []
, parentType: .object("Image"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "icon", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .object("Image"), selectionSet: 
  [
  .field(GraphSelections.Field(name: "__typename", alias: nil
, arguments: 
  []
, parentType: .object("Image"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "transformedSrc", alias: nil
, arguments: 
  []
, parentType: .object("Image"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  ))
  , 
  .field(GraphSelections.Field(name: "title", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "pricingDetails", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "pricingDetailsSummary", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "description", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "features", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("String"), selectionSet: 
  []
  ))
  , 
  .field(GraphSelections.Field(name: "installUrl", alias: nil
, arguments: 
  []
, parentType: .object("App"), type: .scalar("URL"), selectionSet: 
  []
  ))
  ]
  )
}
