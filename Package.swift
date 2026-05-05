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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.4.0/SparkleBridgeClient-0.4.0.xcframework.zip",
            checksum:
"76ef130fa8805245b15b53a1f9db8805d89011cf59baddb687a92f7ce67cb5cd"
        )
    ]
)
