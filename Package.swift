// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CatalystSparkle",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "CatalystSparkle", targets: ["CatalystSparkle"])
    ],
    targets: [
        .binaryTarget(
            name: "CatalystSparkle",
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.1/SparkleBridgeClient-0.1.1.xcframework.zip",
            checksum: "b532177a14bc924684f81b777d4fd5489283458e8e50a25f9b5d57d241d9f2c5"
        )
    ]
)
