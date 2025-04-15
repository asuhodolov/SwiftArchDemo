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
                "Onboarding",
                "iTunesSearch"
            ],
            path: "Root"),
        .target(
            name: "Services",
            dependencies: [
                "Models"
            ],
            path: "Services/Sources"),
        .testTarget(
            name: "ServicesTests",
            dependencies: [
                "Models",
                "Services"
            ],
            path: "Services/Tests"),
        .target(
            name: "Onboarding",
            dependencies: [
                "Services",
                "AppFoundation",
                "CommonUI",
                "OnboardingShared"],
            path: "Features/Onboarding/Sources",
            resources: [
                .process("Resources")
            ]),
        .target(
            name: "iTunesSearch",
            dependencies: [
                "Services",
                "AppFoundation",
                "CommonUI",
                "OnboardingShared"],
            path: "Features/iTunesSearch/Sources",
            resources: [
                .process("Resources")
            ]),
        .testTarget(
            name: "iTunesSearchTests",
            dependencies: [
                "iTunesSearch",
                "Services",
                "Models"
            ],
            path: "Features/iTunesSearch/Tests"),
        .testTarget(
            name: "OnboardingTests",
            dependencies: [
                "Onboarding",
                "OnboardingShared",
                "Services",
                "Models"
            ],
            path: "Features/Onboarding/Tests"),
        .target(
            name: "OnboardingShared",
            dependencies: [
                "Services",
                "AppFoundation"],
            path: "FeaturesShared/OnboardingShared"),
        .target(
            name: "Models",
            path: "Models"),
        .target(
            name: "CommonUI",
            path: "CommonUI"),
        .target(
            name: "AppFoundation",
            path: "AppFoundation")
    ]
)
