//
//  BMCDelegate.swift
//  
//
//  Created by François Boulais on 26/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

public protocol BMCDelegate {
    /// Tells the delegate that the user dismissed the view.
    func bmcViewControllerDidCancel(_ bcmViewController: BMCViewController)
    
    /// Tells the delegate that the user suceeded the transaction.
    func bmcViewControllerDidSucceed(_ bcmViewController: BMCViewController)
}
