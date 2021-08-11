// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKit_k",
    platforms: [
      .iOS(.v10),
      .macCatalyst(.v13),
      .tvOS(.v9),
      .watchOS(.v2)
    ],
    products: [
      // Products define the executables and libraries a package produces, and make them visible to other packages.
      .library(
          name: "UIKit_k",
          targets: ["UIKit_k"]),
    ],
    targets: [
      // Targets are the basic building blocks of a package. A target can define a module or a test suite.
      // Targets can depend on other targets in this package, and on products in packages this package depends on.
      .target(
          name: "UIKit_k",
          dependencies: [])
    ]
)

