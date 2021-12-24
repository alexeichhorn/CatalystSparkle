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
            checksum: "48e3f302d6b5280f4941533d3ee052ff2ea2e355b706bee36c1e74d6bb0e334c"
        )
    ]
)
