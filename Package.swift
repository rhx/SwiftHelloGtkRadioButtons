// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "HelloGtkRadioButtons",
    dependencies: [
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk3")),
    ],
    targets: [
        .target(name: "HelloGtkRadioButtons", dependencies: ["Gtk"]),
    ]
)
