// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CatalystSparkle",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "SparkleBridgeClient", type: .dynamic, targets: ["SparkleBridgeClient"])
    ],
    targets: [
        .binaryTarget(
            name: "SparkleBridgeClient",
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.1/SparkleBridgeClient-0.1.1.xcframework.zip",
            checksum: "98aee2e074a5afa627c1b28c4cae1c0efd4f4be62dc5b099f8a153d3c3e22633"
        )
    ]
)
