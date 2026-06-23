// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AIMarkdownKit",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .watchOS(.v9),
        .visionOS(.v1)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "AIMarkdownKit",
            targets: ["AIMarkdownKit"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "AIMarkdownKit"
        ),
        .testTarget(
            name: "AIMarkdownKitTests",
            dependencies: ["AIMarkdownKit"]
        ),
    ],
    swiftLanguageModes: [.v6]
)
