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
            url: 
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.8/SparkleBridgeClient-0.3.8.xcframework.zip",
            checksum:
"3b5da364264cb4335c4bf56a9eff2a002bfb3b1e4bd860d402db81232e45f4e8"
        )
    ]
)
