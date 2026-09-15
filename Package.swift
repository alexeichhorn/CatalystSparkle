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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.4.4/SparkleBridgeClient-0.4.4.xcframework.zip",
            checksum:
"9c6f308ea72d6c19b1f6675eab253e2dc3946beffdde43e4abcae8ceafa60cea"
        )
    ]
)
