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
"8431f722c5cbfb3615a72181cbd4a6a63bcbd9782875d98e35734e8f72a56450"
        )
    ]
)
