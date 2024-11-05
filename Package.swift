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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.3/SparkleBridgeClient-0.3.3.xcframework.zip",
            checksum:
"a69324bb8c6f3644771c68732147380fa5d82e266e5d664a383fd4e8291a1c1b"
        )
    ]
)
