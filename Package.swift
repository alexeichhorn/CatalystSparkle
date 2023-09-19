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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.4/SparkleBridgeClient-0.2.4.xcframework.zip",
            checksum:  
"ce413caa56ebc60faacf186b02c432dc2cf899a5de20a501a427aeb7a550c8f4"
        )
    ]
)
