//
//  BMCManager.swift
//  
//
//  Created by François Boulais on 30/06/2020.
//

import SafariServices
import UIKit

public final class BMCManager: NSObject {
    public static let shared = BMCManager()
    
    /// The view controller used to present `SFSafariViewContoller` on iOS 9 and 10.
    public var presentingViewController: UIViewController?
    
    public var delegate: BMCDelegate?
    
    public var username = "appcraftstudio"
    
    private override init() { }
    
    @objc public func present() {
        guard let presentingViewController = presentingViewController else {
            fatalError("")
        }

        let storyboard = UIStoryboard(name: "BMCScene", bundle: .module)
    
//        if let url = URL(string: "https://www.buymeacoffee.com/")?.appendingPathComponent(username) {
//            let viewController = SFSafariViewController(url: url)
//            viewController.modalPresentationStyle = .formSheet
//            viewController.preferredControlTintColor = BMCColor.orange.background
//            viewController.dismissButtonStyle = .close
//            presentingViewController.present(viewController, animated: true, completion: nil)
//        }
        
        if let viewController = storyboard.instantiateInitialViewController() {
            viewController.modalPresentationStyle = .formSheet
            presentingViewController.present(viewController, animated: true, completion: nil)
        }
    }
}
