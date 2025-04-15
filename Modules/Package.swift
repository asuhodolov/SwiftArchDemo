// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Root",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "Root",
            targets: ["Root"]),
    ],
    targets: [
        .target(
            name: "Root",
            dependencies: [
                "Services",
                "Features",
                "CommonUI"],
            path: "Root"),
        .target(
            name: "Services",
            dependencies: [
                "Models"
            ],
            path: "Services"),
        .target(
            name: "Features",
            dependencies: [
                "Services",
                "Foundation",
                "CommonUI",
                "FeaturesShared"],
            path: "Features",
            resources: [
                .process("Resources")
                ]),
        .target(
            name: "FeaturesShared",
            dependencies: [
                "Services",
                "Foundation"],
            path: "FeaturesShared"),
        .target(
            name: "Models",
            path: "Models"),
        .target(
            name: "CommonUI",
            dependencies: [
            ],
            path: "CommonUI"
        ),
        .target(
            name: "Foundation",
            dependencies: [],
            path: "Foundation"
        )
    ]
)
