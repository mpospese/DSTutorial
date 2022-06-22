// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "DSKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "DSKit",
            targets: ["DSKit"]
        )
    ],
    dependencies: [
        // Auto-layout helpers, WCAG color contrast checking
        .package(url: "https://github.com/yml-org/YCoreUI", from: "1.0.0"),
        // Typography support
        .package(url: "https://github.com/yml-org/YMatterType", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "DSKit",
            dependencies: ["YCoreUI", "YMatterType"],
            resources: [
                // Asset catalog, fonts, etc.
                .process("Assets")
            ]
        ),
        .testTarget(
            name: "DSKitTests",
            dependencies: ["DSKit"]
        )
    ]
)
