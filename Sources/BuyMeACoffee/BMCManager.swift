//
//  BMCManager.swift
//  
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import UIKit

public final class BMCManager: NSObject {
    public static let shared = BMCManager()
    
    /// The view controller used to present `BMCViewContoller`
    public var presentingViewController: UIViewController?
    
    public var delegate: BMCDelegate?
    
    public var username = "appcraftstudio"
    
    private override init() { }
    
    public func present(animated: Bool, completion: (() -> Void)?) {
        guard let presentingViewController = presentingViewController else {
            fatalError("")
        }

        let storyboard = UIStoryboard(name: "BMCScene", bundle: .module)
    
        if let viewController = storyboard.instantiateInitialViewController() {
            viewController.modalPresentationStyle = .formSheet
            presentingViewController.present(viewController, animated: true, completion: nil)
        }
    }
        
    @objc internal func start() {
        present(animated: true, completion: nil)
    }
}
