// swift-tools-version:6.0

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "swift-mc",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v13)
    ],
    dependencies: [
        // Networking & Server
        .package(url: "https://github.com/apple/swift-asn1", from: "1.3.0"),

        // Macros
        .package(url: "https://github.com/apple/swift-syntax", from: "600.0.1"),

        // Localization
        .package(url: "https://github.com/RandomHashTags/swift-string-catalogs", from: "1.0.0")
    ],
    targets: [
        .macro(
            name: "MinecraftMacros",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),

        .target(
            name: "App",
            dependencies: [
                "MinecraftBlueprint",
                
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "SwiftStringCatalogs", package: "swift-string-catalogs")
            ],/*
            resources: [
                .process("Resources")
            ],*/
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),

        .target(
            name: "MinecraftUtilities",
            dependencies: [
                "MinecraftMacros"
            ]
        ),
        .target(
            name: "MinecraftPackets",
            dependencies: [
                "MinecraftMacros",
                "MinecraftUtilities",
            ]
        ),
        .target(
            name: "MinecraftBlueprint",
            dependencies: [
                "MinecraftMacros",
                "MinecraftPackets"
            ]
        ),

        .target(
            name: "MinecraftPacketsJava",
            dependencies: [
                "MinecraftMacros",
                "MinecraftPackets"
            ]
        ),
        .target(
            name: "MinecraftBlueprintJava",
            dependencies: [
                "MinecraftBlueprint",
                "MinecraftMacros",
                "MinecraftPacketsJava"
            ]
        ),

        .executableTarget(
            name: "Run",
            dependencies: ["App"]
        ),
        .testTarget(
            name: "swift_gluon-serverTests",
            dependencies: [
                "App"
            ]
        ),
    ]
)
