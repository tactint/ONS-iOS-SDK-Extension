// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ONSBatchExtension",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ONSBatchExtension",
            targets: ["ONSBatchExtension"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ONSBatchExtension",
            dependencies: [],
            path: "Sources/Swift",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            swiftSettings: [.define("BATCHEXTENSION_PURE_SWIFT")]
            ),
    ]
)
