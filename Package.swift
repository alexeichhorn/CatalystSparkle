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
"https://github.com/alexeichhorn/CatalystSparkle/releases/download/0.2.2/SparkleBridgeClient-0.2.2.xcframework.zip",
            checksum: "7f892eb4c3e222be016d978d44c0766e5630b02b411b65a7e7eb57d42e8d4ea6"
        )
    ]
)
