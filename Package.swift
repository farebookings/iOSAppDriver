// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "iOSAppDriver",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "iOSAppDriver",
            targets: ["iOSAppDriver"]
        ),
    ],
    targets: [
        .target(
            name: "iOSAppDriver",
            dependencies: [],
            path: "Sources"
        ),
    ]
)
