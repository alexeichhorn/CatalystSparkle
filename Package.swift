// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CatalystSparkle",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "CatalystSparkle", targets: ["CatalystSparkle"])
    ],
    targets: [
        .binaryTarget(
            name: "CatalystSparkle",
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.1/SparkleBridgeClient-0.1.1.xcframework.zip",
            checksum: "a8753064acfe8a639214a30df6d7d030a636a6696b2d5d5d7bbf880e7c5977fd"
        )
    ]
)
