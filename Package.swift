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
            checksum: "8180278d8ff6bc0fed36663c5b6fcaba8007c232e1da7615618818a33e2da10b"
        )
    ]
)
