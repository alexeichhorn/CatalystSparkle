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
            checksum: "b7a6e25575fd4db2869fb63f62fc5b743538d42e9f6e179c294696f116643618"
        )
    ]
)
