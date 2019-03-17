// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "HelloGtkRadioButtons",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", .branch("master")),
    ],
    targets: [
        .target(name: "HelloGtkRadioButtons", dependencies: ["Gtk"]),
    ]
)
