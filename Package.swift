// swift-tools-version:5.0

import PackageDescription

let package = Package(
	name: "Syrup",
	platforms: [
		.macOS(.v10_13)
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
			url: "https://github.com/RyanBillard/SwiftGraphQLParser",
			from: "0.1.7"
		)
	],
	targets: [
		.target(
			name: "Syrup",
			dependencies: ["SyrupCore", "Utility"]
		),
		.target(
			name: "SyrupCore",
			dependencies: ["Stencil", "Files", "Yams", "Utility", "SwiftGraphQLParser"]
		),
		.testTarget(
			name: "SyrupTests",
			dependencies: ["Syrup"],
			path: "Tests/Swift"
		)
	],
	swiftLanguageVersions: [.version("5")]
)
