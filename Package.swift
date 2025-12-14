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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.9/SparkleBridgeClient-0.3.9.xcframework.zip",
            checksum:
"c93c9bcfe23e0e154940aabd961e0b404392d08b8554595ac4c2878e272056a8"
        )
    ]
)
