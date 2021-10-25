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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.8/SparkleBridgeClient-0.1.8.xcframework.zip",
            checksum: "d312c055db9d5cb941fad32c8f1c484a9fb5e2235dfa818b881f3d05c78105bd"
        )
    ]
)
