import PackageDescription

let package = Package(
        name: "VaporMix",
        targets: [],
        dependencies: [
                .Package(url: "https://github.com/vapor/leaf.git", majorVersion: 1),
                .Package(url: "https://github.com/vapor/json.git", majorVersion: 1),
        ]
)
