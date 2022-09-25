// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LeithaViewModel",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LeithaViewModel",
            targets: ["LeithaViewModel"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            name: "BaseLeithaNews",
            path: "../BaseLeithaNews"
        ),
        .package(
            name: "LeithaNetwork",
            path: "../LeithaNetwork"
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LeithaViewModel",
            dependencies: [
                "BaseLeithaNews",
                "LeithaNetwork"
            ]),
        .testTarget(
            name: "LeithaViewModelTests",
            dependencies: ["LeithaViewModel"]),
    ],
    swiftLanguageVersions: [.v5]
)
