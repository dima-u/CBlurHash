// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CBlurHash",
    platforms: [
        .iOS(.v13)
        ],
    products: [
        .library(
            name: "CBlurHash",
            targets: ["blurhash", "CBlurHash"]),
    ],
    targets: [
        .target(
          name: "blurhash",
          dependencies: []
        ),
        .target(
          name: "CBlurHash",
          dependencies: ["blurhash"]
        )
    ]
)
