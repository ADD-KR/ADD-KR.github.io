// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "AVFAudio_k",
  platforms: [
    .iOS("14.5"),
    .macOS("11.3"),
    .macCatalyst("14.5"),
    .tvOS("14.5"),
    .watchOS("7.4")
  ],
  products: [
    // Products define the executables and libraries a package produces, and make them visible to other packages.
    .library(
      name: "AVFAudio_k",
      targets: ["AVFAudio_k"]),
  ],
  targets: [
    // Targets are the basic building blocks of a package. A target can define a module or a test suite.
    // Targets can depend on other targets in this package, and on products in packages this package depends on.
    .target(
      name: "AVFAudio_k",
      dependencies: [])
  ]
)
