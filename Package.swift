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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.1/SparkleBridgeClient-0.3.1.xcframework.zip",
            checksum:
"318800b45b06ec1c73fd5a5875bd817a96af136a0dc312de243282e1b24d985b"
        )
    ]
)
