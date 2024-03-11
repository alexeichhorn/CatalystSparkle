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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.0/SparkleBridgeClient-0.3.0.xcframework.zip",
            checksum:
"4ea3ca749915762d1676a391712fe297d3afcb659477343ad6cefd5708e82e94"
        )
    ]
)
