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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.7/SparkleBridgeClient-0.1.7.xcframework.zip",
            checksum: "c057ae446a3444fe6f7ef915a38b6550ba644a9703323eea2f44edb5a9d71486"
        )
    ]
)
