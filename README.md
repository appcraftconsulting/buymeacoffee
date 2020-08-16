# A supporter is  worth a thousand  followers. 

### [Buy Me a Coffee](https://www.buymeacoffee.com) is a modern creator platform. It takes two minutes to start your page and has all the features that you need to build your creative business.

**Donations :moneybag:**  
Give your audience a friendly way to thank you.

**Memberships :spiral_calendar:**  
Earn recurring revenue by offering a monthly or yearly membership.

**Sell Extras :sparkles:**  
A new, creative way to offer Zoom calls, art commissions, anything.

## Features

- [X] Apple Pay
- [X] iCloud Keychain

## Requirements

CocoaPods | Swift Package Manager
:---: | :---:
Swift 5.0 | Swift 5.3
Xcode 11.x | Xcode 12.x

## App Store Review

According to App Store Review Guidelines, at [3.2.1](https://developer.apple.com/app-store/review/guidelines/#acceptable):

> **(vii)** Apps may enable individual users to give a monetary gift to another individual without using in-app purchase, provided that (a) the gift is a completely optional choice by the giver, and (b) 100% of the funds go to the receiver of the gift. However, a gift that is connected to or associated at any point in time with receiving digital content or services must use in-app purchase.

## Usage
### `BMCButton`

[<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/snapshot-bmc-button.png">](https://www.buymeacoffee.com/appcraftstudio)

`BMCButton` is a `@IBDesignable` `UIButton` subclass that comply the official Buy Me a Coffee guidelines. 
It can be customized through its `configuration` field at initialization or later if added in Interface Builder:

```swift
let button = BMCButton(configuration: .default)
button.configuraton = .init(color: .orange, font: .cookie)
```

### `BMCManager`

`BMCManager` is a singleton that is used to configure both username and presenting view controller. The username is the one you've chosen on www.buymeacoffee.com, and the presenting view controller is the one that will be used to present donation flow when user tap on the `BMCButton`.
It can be configured in the `viewDidLoad` function:

```swift
override func viewDidLoad() {
    super.viewDidLoad()

    BMCManager.shared.username = "appcraftstudio"
    BMCManager.shared.presentingViewController = self
}
```

## Configure In-App Purchase

### App Store Connect

In order to pass App Store Review, you'll have to configure an In-App Purchase. Go to [App Store Connect](https://appstoreconnect.apple.com), search for the *In-App Purchases* section of your app, and then, create a new one with the following informations:

#### General
- Type: *Consumable*
- Reference Name: `Buy Me a Coffee`
- Product ID: *your.app.bundle.identifier*`.buymeacoffee`
- Cleared for Sale: :white_check_mark:
- Price Tier: The cost of the :coffee:

#### App Store
- Display Name: `Buy Me a Coffee`
- Description: `Hey there! You can now buy me a coffee!`

#### Promotion in App Store (optional)
- *Image*: [download the resource](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/in-app-purchase-promotional-image.jpg)

#### Review
- *Screenshot*: [download the resource](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/in-app-purchase-promotional-image.jpg)
- *Message*: `Buy Me a Coffee enable customers to “tip” digital content providers in the app.`

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

<a href="https://www.producthunt.com/posts/buy-me-a-coffee-framework-for-ios?utm_source=badge-featured&utm_medium=badge&utm_souce=badge-buy-me-a-coffee-framework-for-ios" target="_blank"><img src="https://api.producthunt.com/widgets/embed-image/v1/featured.svg?post_id=233953&theme=dark" alt="Buy Me a Coffee framework for iOS - Embed Buy Me a Coffee framework in your applications | Product Hunt Embed" style="width: 250px; height: 54px;" width="250px" height="54px" /></a>

Copyright © 2020 App Craft Studio. All rights reserved.
