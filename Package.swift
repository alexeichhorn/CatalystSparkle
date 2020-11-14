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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.5/SparkleBridgeClient-0.1.5.xcframework.zip",
            checksum: "32b072ff67f89c54151e248118d8d4467196d5a7ace36e2aab621315cbef18d4"
        )
    ]
)
