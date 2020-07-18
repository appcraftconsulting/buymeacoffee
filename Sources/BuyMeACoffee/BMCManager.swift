//
//  BMCManager.swift
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if !os(macOS)
import UIKit
#endif


public final class BMCManager: NSObject {
    public static let shared = BMCManager()
    
    /// The view controller used to present `BMCViewContoller`
    public var presentingViewController: UIViewController?
    
    public var delegate: BMCDelegate?
    
    public var username = "appcraftstudio"
    
    private override init() { }
    
    @objc public func start() {
        guard let presentingViewController = presentingViewController else {
            fatalError("presentingViewController must be set.")
        }

        let storyboard = UIStoryboard(name: "BMCScene", bundle: .module)
    
        if let viewController = storyboard.instantiateInitialViewController() {
            viewController.modalPresentationStyle = .formSheet
            presentingViewController.present(viewController, animated: true)
        }
    }
}
