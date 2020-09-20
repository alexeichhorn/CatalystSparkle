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
            url: "https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.1.2/SparkleBridgeClient-0.1.2.xcframework.zip",
            checksum: "3165278ee8433dcf101586de36bebff34b5f3984ee904bc67052cfa89198abb3"
        )
    ]
)
