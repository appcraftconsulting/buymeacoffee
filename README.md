![Swift](https://github.com/appcraftstudio/buymeacoffee/workflows/Swift/badge.svg)

# A supporter is  worth a thousand  followers. 

### [Buy Me a Coffee](https://www.buymeacoffee.com) is a modern creator platform. It takes two minutes to start your page and has all the features that you need to build your creative business.

**Donations :moneybag:**  
Give your audience a friendly way to thank you.

**Memberships :spiral_calendar:**  
Earn recurring revenue by offering a monthly or yearly membership.

**Sell Extras :sparkles:**  
A new, creative way to offer Zoom calls, art commissions, anything.  

<p align="center">
<br>
<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/screenshot-buymeacoffee-home.png" width="320">
<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/screenshot-buymeacoffee-apple-pay.png" width="320">
</p>

## Features

- [X] Apple Pay
- [X] iCloud Keychain

## Requirements

CocoaPods | Swift Package Manager
:---: | :---:
Swift 5.0 | Swift 5.3
Xcode 11.x | Xcode 12.x

## App Store Review 

These are the two App Store Review Guidelines articles you have to know before using this framework:

[3.1.1 In-App Purchase](https://developer.apple.com/app-store/review/guidelines/#in-app-purchase)
> - Apps may use in-app purchase currencies to enable customers to “tip” digital content providers in the app.

[3.2.1 Acceptable](https://developer.apple.com/app-store/review/guidelines/#acceptable):
> **(vii)** Apps may enable individual users to give a monetary gift to another individual without using in-app purchase, provided that (a) the gift is a completely optional choice by the giver, and (b) 100% of the funds go to the receiver of the gift. However, a gift that is connected to or associated at any point in time with receiving digital content or services must use in-app purchase.

## Implement Buy Me a Coffee

1. Import the BuyMeACoffee framework in your `UIApplicationDelegate`:
```swift
import BuyMeACoffee
```
2. Configure the `BMCManager` shared instance with the username you've chosen on www.buymeacoffee.com, typically in your app's `application:didFinishLaunchingWithOptions:` method:
```swift
BMCManager.shared.configure(username: "appcraftstudio")
```
3. In the view controller, override the `viewDidLoad` method to set the presenting view controller of the `BMCManager` object.
```swift
BMCManager.shared.presentingViewController = self
// You can also set a custom thank you message
BMCManager.shared.thankYouMessage = "Thank you for supporting 🎉 App Craft Studio !"
```
4. Add a `BMCButton` to your storyboard, XIB file, or instantiate it programmatically. To add the button to your storyboard or XIB file, add a View and set its custom class to `BMCButton`.
5. **Optional**: If you want to customize the button, do the following:
```swift
let button = BMCButton(configuration: .default)
button.configuraton = .init(color: .orange, font: .cookie)
```

<p align="center">
<br>
<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/snapshot-bmc-button.png" width="300">
</p>

## (Optional) Configure In-App Purchase

Depending the legal receiver of the gift configured on Buy Me a Coffee, App Store reviewers can ask for In-App Purchase implementation.  
If the following In-App Purchase if configured for your application, it will be displayed as primary flow when user tap on the `BMCButton`.

**If the framework can't retrieve In-App Purchase informations, the web flow will be used as fallback.**

### App Store Connect

Go to [App Store Connect](https://appstoreconnect.apple.com), search for the *In-App Purchases* section of your app, and then, create a new one with the following informations:

|||
| --- | --- |
| **Type** | Consumable |
| **Reference Name** | *Buy Me a Coffee* |
| **Product ID** | `your.app.bundle.identifier`*.buymeacoffee* |
| **Cleared for Sale** | :white_check_mark: |
| **Price** | Tier 4 |
| **Display Name** | *Buy Me a Coffee* |
| **Description** | *Hey there! You can now buy me a coffee!*
| **Promotional Image** | [download here](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/%20in-app-purchase-promotional-image.jpg) |
| **Review Screenshot** | [download here](https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/%20in-app-purchase-review-screenshot.png) |
| **Review Notes** | *Buy Me a Coffee enable customers to “tip” digital content providers in the app.* |

### Capabilities

1. Select the current workspace in the project navigator.
2. Then, select the app target in the left panel.
3. Go to the *Signing & Capabilities* tab.
4. Add the *In-App Purchase* capability.

<p align="center">
<img src="https://github.com/appcraftstudio/buymeacoffee/raw/master/Images/screenshot-xcode-capabilities.png" width="600">
</p>

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

<a href="https://www.buymeacoffee.com/appcraftstudio" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-yellow.png" alt="Buy Me A Coffee" style="height: 60px !important;width: 217px !important;" ></a>

Copyright © 2020 App Craft Studio. All rights reserved.
