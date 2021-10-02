// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "Web3Async",
    platforms: [
       .iOS(.v15),
       .macOS(.v12)
    ],
    products: [
        .library(
            name: "Web3Async",
            targets: ["Web3Async"]),
    ],
    dependencies: [
        .package(name: "Web3", url: "https://github.com/Boilertalk/Web3.swift.git", from: "0.5.0"),
    ],
    targets: [
        .target(
            name: "Web3Async",
            dependencies: ["Web3"]),
        .testTarget(
            name: "Web3AsyncTests",
            dependencies: ["Web3Async"]),
    ]
)
