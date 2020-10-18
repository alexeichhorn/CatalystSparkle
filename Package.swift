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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.4/SparkleBridgeClient-0.1.4.xcframework.zip",
            checksum: "d3ec5f5fff72927585bfb922d2918197f430748830f227807f0c8fbd4458d7b1"
        )
    ]
)
