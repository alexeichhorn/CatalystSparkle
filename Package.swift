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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.7/SparkleBridgeClient-0.3.7.xcframework.zip",
            checksum:
"0486310369748306c8b92c8d7f3bd1690d200938b739f4b5488b1dfd59df0a32"
        )
    ]
)
