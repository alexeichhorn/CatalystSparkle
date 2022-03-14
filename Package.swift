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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.0/SparkleBridgeClient-0.2.0.xcframework.zip",
            checksum: "865c0b9abf10696082125257b619ff3276501529d1d8f184c8828541f791e13b"
        )
    ]
)
