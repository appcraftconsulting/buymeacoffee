# A supporter is  worth a thousand  followers. 

>[Buy Me a Coffee](https://www.buymeacoffee.com) is a modern creator platform. It takes two minutes to start your page and has all the features that you need to build your creative business.

**Donations**.  
Give your audience a friendly way to thank you.

**Memberships**  
Earn recurring revenue by offering a monthly or yearly membership.

**Sell Extras**  
A new, creative way to offer Zoom calls, art commissions, anything.

![Apple Pay](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/apple-pay-mark.png)

## Requirements

* Xcode 11.x
* Swift 5.3

## Usage
### `BMCButton`

[<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/snapshot-bmc-button.png">](https://www.buymeacoffee.com/appcraftstudio)

`BMCButton` is a `@IBDesignable` `UIButton` subclass that can comply the official Buy Me a Coffee guidelines. 
It can be customized through its `configuration` field at initialization or later if added in Interface Builder:

```swift
let button = BMCButton(configuration: .default)
button.configuraton = .init(color: .orange, font: .cookie)
```

### `BMCManager`

## Installation

### [CocoaPods](https://guides.cocoapods.org/using/using-cocoapods.html)

You want to add pod `'BuyMeACoffee', '~> 1.0'` similar to the following to your Podfile:
```rb
target 'MyApp' do
  pod 'BuyMeACoffee', '~> 1.0'
end
```
Then run a `pod install` inside your terminal, or from CocoaPods.app.

### [Swift Package Manager](https://swift.org/package-manager/)

1. Using Xcode 11 or above go to *File* > *Swift Packages* > *Add Package Dependency*
2. Paste the project URL: https://github.com/appcraftstudio/buymeacoffee.git
3. Click on next and select the project target

![Swift Package Manager](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/screenshot-xcode-spm.png)

---

Copyright © 2020 App Craft Studio. All rights reserved.
