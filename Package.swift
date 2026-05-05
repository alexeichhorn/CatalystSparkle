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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.4.1/SparkleBridgeClient-0.4.1.xcframework.zip",
            checksum:
"3b4b36894a555537dcc5206986e78b7911cde5d1ca97e7cb8291edba582e3a73"
        )
    ]
)
