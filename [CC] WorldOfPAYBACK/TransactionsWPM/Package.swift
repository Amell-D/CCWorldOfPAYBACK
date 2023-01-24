// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// MARK: Usable modules
let network = "NetworkKit"
let uiComponents = "UIComponentsKit"
let navigation = "NavigationCoordinatorKit"

let package = Package(
    name: "TransactionsWPM",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "TransactionsWPM",
            targets: ["TransactionsWPM"]),
    ],
    dependencies: [
        .package(name: network, path: "../NetworkKit"),
        .package(name: uiComponents, path: "../UIComponentsKit"),
        .package(name: navigation, path: "../NavigationCoordinatorKit")
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "TransactionsWPM",
            dependencies: [
                .product(name: network, package: network),
                .product(name: uiComponents, package: uiComponents),
                .product(name: navigation, package: navigation)
            ]),
        .testTarget(
            name: "TransactionsWPMTests",
            dependencies: ["TransactionsWPM"]),
    ]
)
