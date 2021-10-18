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
            checksum: "d822a7e92f219b713b31a1aa67cb8b0b7cd19799826d7eaa2781d250be1eb130"
        )
    ]
)
