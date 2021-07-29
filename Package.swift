// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "Syrup",
	platforms: [
		.macOS(.v10_15)
	],
	products: [
		.executable(
			name: "Syrup",
			targets: ["Syrup"]
		),
		.library(
			name: "SyrupCore",
			targets: ["SyrupCore"]
		)
	],
	dependencies: [
		.package(
			url: "https://github.com/stencilproject/Stencil.git",
			.exact("0.13.0")
		),
		.package(
			url: "https://github.com/JohnSundell/files",
			from: "4.0.2"
		),
		.package(
			url: "https://github.com/jpsim/Yams.git",
			from: "2.0.0"
		),
		.package(
			url: "https://github.com/apple/swift-package-manager.git",
			.exact("0.3.0")
		),
		.package(
			url: "https://github.com/Shopify/SwiftGraphQLParser",
			from: "0.1.8"
		),
        .package(
            url: "https://github.com/apple/swift-crypto.git",
            .exact("1.1.6")
        )
	],
	targets: [
		.target(
			name: "Syrup",
			dependencies: ["SyrupCore", "Utility"]
		),
		.target(
			name: "SyrupCore",
			dependencies: ["Stencil", "Files", "Yams", "Utility", "SwiftGraphQLParser", "Crypto"]
		),
		.testTarget(
			name: "SyrupTests",
			dependencies: ["Syrup"],
			path: "Tests/Swift"
		)
	],
	swiftLanguageVersions: [.version("5")]
)
