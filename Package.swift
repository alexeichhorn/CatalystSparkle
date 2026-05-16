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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.4.2/SparkleBridgeClient-0.4.2.xcframework.zip",
            checksum:
"80a0271fae496d6c2dede8a2e9df16e3077211e77bbf4832a8c79f9d170bf2a2"
        )
    ]
)
