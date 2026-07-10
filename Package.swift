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
            url: 
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.4.3/SparkleBridgeClient-0.4.3.xcframework.zip",
            checksum:
"948094c4c7fcd801aca0d2770ee8c2360d95005f5d75a3c32c65fbbca2d884c1"
        )
    ]
)
