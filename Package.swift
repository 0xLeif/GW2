// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GW2",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "GW2",
            targets: ["GW2"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/broadwaylamb/OpenCombine.git", from: "0.8.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "GW2",
            dependencies: ["OpenCombine", "OpenCombineDispatch", "OpenCombineFoundation"]),
        .testTarget(
            name: "GW2Tests",
            dependencies: ["GW2", "OpenCombine", "OpenCombineDispatch", "OpenCombineFoundation"]),
    ]
)
