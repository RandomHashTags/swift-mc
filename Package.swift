// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
        .package(url: "https://github.com/apple/swift-nio", from: "2.76.1"),
        .package(url: "https://github.com/vapor/vapor", from: "4.106.4"),
        .package(url: "https://github.com/Kitura/BlueSocket", from: "2.0.4"),
        .package(url: "https://github.com/apple/swift-asn1", from: "1.3.0"),
        .package(url: "https://github.com/vapor/console-kit", from: "4.14.2"),

        // Macros
        .package(url: "https://github.com/apple/swift-syntax", from: "600.0.1"),

        // Localization
        .package(url: "https://github.com/RandomHashTags/swift-string-catalogs", from: "1.0.0")
    ],
    targets: [
        .macro(
            name: "GluonMacros",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
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
                "GluonMacros",
                "MinecraftMacros",
                //.product(name: "BlueSocket", package: "BlueSocket"),
                .product(name: "Vapor", package: "vapor"),
                
                .product(name: "Socket", package: "BlueSocket"),
                .product(name: "SwiftASN1", package: "swift-asn1"),
                .product(name: "SwiftStringCatalogs", package: "swift-string-catalogs")
            ],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .unsafeFlags(["-cross-module-optimization"], .when(configuration: .release))
            ]
        ),

        .target(
            name: "Utilities",
            dependencies: [
                .product(name: "NIO", package: "swift-nio")
            ]
        ),
        .target(
            name: "Packets",
            dependencies: [
                "Utilities"
            ]
        ),
        .target(
            name: "API",
            dependencies: [
                "Packets"
            ]
        ),

        .target(
            name: "PacketsJava",
            dependencies: [
                "Packets"
            ]
        ),
        .target(
            name: "APIJava",
            dependencies: [
                "API",
                "PacketsJava"
            ]
        ),

        .executableTarget(name: "Run", dependencies: [.target(name: "App")]),
        .testTarget(name: "swift_gluon-serverTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor")
        ]),
    ]
)
