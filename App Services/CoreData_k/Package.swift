// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreData_k",
    platforms: [
      .iOS("3.0"),
//      .macOS("10.4"),
      .macCatalyst("13.0"),
      .tvOS("9.0"),
      .watchOS("2.0")
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CoreData_k",
            targets: ["CoreData_k"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "CoreData_k",
            dependencies: [])
    ]
)
