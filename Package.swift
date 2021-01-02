// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "HelloGtkRadioButtons",
    dependencies: [
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk4")),
    ],
    targets: [
        .target(name: "HelloGtkRadioButtons", dependencies: ["Gtk"]),
    ]
)
