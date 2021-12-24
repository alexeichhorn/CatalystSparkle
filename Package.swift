// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CatalystSparkle",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "SparkleBridgeClient", targets: ["SparkleBridgeClient"])
    ],
    targets: [
        .binaryTarget(
            name: "SparkleBridgeClient",
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.9/SparkleBridgeClient-0.1.9.xcframework.zip",
            checksum: "7b658d419b26a45ca257003fa7fd4800d66305a0e0d1fb3844e6626bb0b6a70c"
        )
    ]
)
