# BuyMeACoffee ☕️!
[Buy Me a Coffee](https://www.buymeacoffee.com) framework for iOS.

[<img src="https://github.com/appcraftstudio/buymeacoffee/blob/master/bmc-button.png">](https://www.buymeacoffee.com/appcraftstudio)

## Installation

### CocoaPods

You want to add pod `'BuyMeACoffee', '~> 1.0'` similar to the following to your Podfile:
```rb
target 'MyApp' do
  pod 'BuyMeACoffee', '~> 1.0'
end
```
Then run a `pod install` inside your terminal, or from CocoaPods.app.

---
Alternatively to give it a test run, run the command:

`pod try BuyMeACoffee`

### Swift Package Manager

To integrate using Apple's Swift package manager, add the following as a dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/appcraftstudio/buymeacoffee.git", .upToNextMajor(from: "1.0.0"))
```

and then specify `"BuyMeACoffee"` as a dependency of the Target in which you wish to use BuyMeACoffee.
Here's an example `PackageDescription`:

```swift
// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "MyPackage",
    products: [
        .library(
            name: "MyPackage",
            targets: ["MyPackage"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appcraftstudio/buymeacoffee.git", .upToNextMajor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "MyPackage",
            dependencies: ["BuyMeACoffee"])
    ]
)
```
