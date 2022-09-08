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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.1/SparkleBridgeClient-0.2.1.xcframework.zip",
            checksum: "0cc07f65b25488b6ec53398a26c55b4d72666011489a67d1da99e3dbd56fc955"
        )
    ]
)
