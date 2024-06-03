// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ONSExtension",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "ONSExtension",
            targets: ["ONSExtension"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ONSExtension",
            dependencies: [],
            path: "Sources/Swift",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            swiftSettings: [.define("ONSExtension_PURE_SWIFT")]
            ),
    ]
)
