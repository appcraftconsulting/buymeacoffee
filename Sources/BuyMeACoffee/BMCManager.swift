//
//  BMCManager.swift
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if !os(macOS)
import UIKit
#endif

import SafariServices

public final class BMCManager: NSObject {
    public static let shared = BMCManager()
    
    /// The view controller used to present `BMCViewContoller`
    public var presentingViewController: UIViewController?
        
    public var username = "appcraftstudio"
    
    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(BMCManager.shared.username))
    }
    
    private override init() { }
    
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
