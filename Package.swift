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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.2/SparkleBridgeClient-0.3.2.xcframework.zip",
            checksum:
"a31c7e292cf1279ad34f4ef31bab1457a007b14d73753e83c4bb9bed31affa46"
        )
    ]
)
