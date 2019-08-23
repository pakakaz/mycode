// swift-tools-version:4.2
import PackageDescription

let package = Package(
name: "MyCode",
products: [
.library(name: "MyCode", targets: ["MyCode"]),
],
// dependencies: [
// .package(path: "../FastaiNotebook_09_optimizer")
// ],
targets: [
.target(name: "MyCode", dependencies: []),
]
)