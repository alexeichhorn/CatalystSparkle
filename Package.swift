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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.6/SparkleBridgeClient-0.3.6.xcframework.zip",
            checksum:
"e45bb5d559609df09917c2ae36721fa0224df93c42b7cf8682a6c3f4c8d11af2"
        )
    ]
)
