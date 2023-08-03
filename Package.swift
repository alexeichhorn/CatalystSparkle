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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.3/SparkleBridgeClient-0.2.3.xcframework.zip",
            checksum: "5e9bd60d7dcf0eaa9f093240cc32cf7946e7c7c04aa14b0642f31df6c70a06a7"
        )
    ]
)
