//
//  ViewController.swift
//  CocoaPodsDemo
//
//  Created by François Boulais on 01/07/2020.
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
    
    func bmcViewControllerDidCancel(_ bcmViewController: BMCViewController) {
        bcmViewController.dismiss(animated: true, completion: nil)
    }
    
    func bmcViewControllerDidSucceed(_ bcmViewController: BMCViewController) {
        bcmViewController.dismiss(animated: true, completion: nil)
    }
}

