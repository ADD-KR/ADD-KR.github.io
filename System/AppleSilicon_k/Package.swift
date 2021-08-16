// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AppleSilicon_k",
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "AppleSilicon_k",
      targets: ["AppleSilicon_k"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "AppleSilicon_k",
      dependencies: [])
  ]
)
