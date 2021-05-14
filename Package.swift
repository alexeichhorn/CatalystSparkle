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
            checksum: "769363e1526f25b783116c402456145336ade2b78a4c0b2bcc693268ab4824f7"
        )
    ]
)
