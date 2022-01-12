// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBlurHash",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "CBlurHash",
            targets: ["CBlurHash"]),
    ],
    targets: [
      //  .systemLibrary(name: "CBlurHash"),
        .target(
          name: "CBlurHash",
          dependencies: [],
          path: ".",
          exclude: [],
          sources: [
            "Sources/CBlurHash/",
          ]
        )
    ]
)
