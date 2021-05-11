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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.6/SparkleBridgeClient-0.1.6.xcframework.zip",
            checksum: "5e1775aba757c5bd1079d4252c814fa4f25be15f0ac13b74188d6351fda2d5d8"
        )
    ]
)
