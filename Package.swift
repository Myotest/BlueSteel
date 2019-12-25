// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BlueSteel",
    platforms: [.iOS("11.3"), .macOS("10.13"), .watchOS("4.3")],
    products: [
        .library(
            name: "BlueSteel",
            targets: ["BlueSteel"]),
    ],
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/BlueCryptor.git", from: "1.0.32") // "Cryptor"
    ],
    targets: [
        .target(
            name: "BlueSteel",
            dependencies: ["Cryptor"]),
        .testTarget(
            name: "BlueSteelTests",
            dependencies: ["BlueSteel"]),
    ]
)
