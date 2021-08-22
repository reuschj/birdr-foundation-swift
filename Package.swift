// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BirdrFoundation",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "BirdrFoundation",
            targets: ["BirdrFoundation"]),
        .library(
            name: "BirdrModel",
            targets: ["BirdrModel"]),
        .library(
            name: "BirdrServiceModel",
            targets: ["BirdrServiceModel"]),
        .library(
            name: "BirdrUserModel",
            targets: ["BirdrUserModel"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BirdrFoundation",
            dependencies: []),
        .target(
            name: "BirdrModel",
            dependencies: ["BirdrFoundation"]),
        .target(
            name: "BirdrServiceModel",
            dependencies: ["BirdrFoundation"]),
        .target(
            name: "BirdrUserModel",
            dependencies: ["BirdrFoundation"]),
        // Testing -----------------------------------------------/
        .testTarget(
            name: "BirdrFoundationTests",
            dependencies: ["BirdrFoundation"]),
        .testTarget(
            name: "BirdrModelTests",
            dependencies: ["BirdrFoundation", "BirdrModel"]),
        .testTarget(
            name: "BirdrServiceModelTests",
            dependencies: ["BirdrFoundation", "BirdrServiceModel"]),
        .testTarget(
            name: "BirdrUserModelTests",
            dependencies: ["BirdrFoundation", "BirdrUserModel"])
    ]
)
