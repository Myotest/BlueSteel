import PackageDescription

let package = Package(
    name: "BlueSteel"
    dependencies: [
        .Package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", versions: "2.3.3" ..< Version.max)
    ]
)
