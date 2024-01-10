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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.5/SparkleBridgeClient-0.2.5.xcframework.zip",
            checksum:
"eda403842e852d044cdf031d546c7bb08c3e1a431d88962447b3d6f2c0ad83ed"
        )
    ]
)
