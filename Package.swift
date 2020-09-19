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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.1/SparkleBridgeClient-0.1.1.xcframework.zip",
            checksum: "e865b15af46819d7bf007c4ae748263cd0307fe3e68d0b56ad55312fd8355346"
        )
    ]
)
