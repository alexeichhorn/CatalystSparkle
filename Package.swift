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
            checksum: "ec2ee763f7b26e0d2d18cb3ca46a13a6defc685d775e5aa4508a861db0959973"
        )
    ]
)
