//
//  BMCManager.swift
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import SafariServices

public final class BMCManager: NSObject {
    public static let shared = BMCManager()
    
    /// The view controller used to present donation flow
    public var presentingViewController: UIViewController?
        
    /// The username you've chosen on www.buymeacoffee.com
    public var username = "appcraftstudio"
    
    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(username))
    }
    
    private override init() { }
    
    /// Start the donation flow on presenting view controller
    @objc public func start() {
        guard let presentingViewController = presentingViewController else {
            fatalError("presentingViewController must be set.")
        }
    
        if let url = url {
            let viewController = SFSafariViewController(url: url)
            viewController.preferredControlTintColor = BMCColor.default.background
            viewController.modalPresentationStyle = .formSheet
            presentingViewController.present(viewController, animated: true)
        }
    }
}
#endif
