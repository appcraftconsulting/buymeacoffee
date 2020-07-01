//
//  ViewController.swift
//  CocoaPodsDemo
//
//  Created by François Boulais on 01/07/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import BuyMeACoffee
import UIKit

class ViewController: UIViewController, BMCDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BMCManager.shared.presentingViewController = self
        BMCManager.shared.delegate = self
    }
    
    // MARK: - BMCDelegate
    
    func bmcViewControllerDidCancel(_ bmcViewController: BMCViewController) {
        bmcViewController.dismiss(animated: true, completion: nil)
    }
    
    func bmcViewControllerDidSucceed(_ bmcViewController: BMCViewController) {
        bmcViewController.dismiss(animated: true, completion: nil)
    }
}

