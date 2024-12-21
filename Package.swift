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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.3.4/SparkleBridgeClient-0.3.4.xcframework.zip",
            checksum:
"38ec6750795dc0e6599e48d2d894df599f79d74e9eefb66548e2f7ab862fbefb"
        )
    ]
)
