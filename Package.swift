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
            checksum: "a130bb117e86f3420866b8bca237232ef9730fb7010f0e54ba5eba5ee5b28b64"
        )
    ]
)
