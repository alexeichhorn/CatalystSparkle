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
            checksum: "8b468708fa1cec16f809b97e68102af81e3b934656401084363365d1d2167793"
        )
    ]
)
