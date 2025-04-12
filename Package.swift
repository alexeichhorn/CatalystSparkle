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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.5/SparkleBridgeClient-0.3.5.xcframework.zip",
            checksum:
"7153a7166271461b37edac89331fd8a5aed2706f43e81c28734f39e34859eeb9"
        )
    ]
)
