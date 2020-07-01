//
//  BMCDelegate.swift
//  
//
//  Created by François Boulais on 26/06/2020.
//

public protocol BMCDelegate {
    /// Tells the delegate that the user dismissed the view.
    func bmcViewControllerDidCancel(_ bcmViewController: BMCViewController)
    
    /// Tells the delegate that the user suceeded the transaction.
    func bmcViewControllerDidSucceed(_ bcmViewController: BMCViewController)
}
