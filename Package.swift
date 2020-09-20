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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.3/SparkleBridgeClient-0.1.3.xcframework.zip",
            checksum: "ad0e4ab865af0e5615219842f431d5147a11af846607ddb28bd7dd225dd54eb7"
        )
    ]
)
