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
import StoreKit

public final class BMCManager: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    public static let shared = BMCManager()
    
    // MARK: - Public properties
    
    /// The view controller used to present donation flow
    public var presentingViewController: UIViewController?
    
    // MARK: - Internal properties
    
    internal var product: SKProduct?

    // MARK: - Private properties
    
    private var username = "appcraftstudio"
    private var productsRequest: SKProductsRequest?
    private let paymentQueue: SKPaymentQueue = .default()

    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(username))
    }
        
    // MARK: - Public functions
    
    /**
     Configure the manager for future donation requests
     - parameters:
        - username: The username you've chosen on www.buymeacoffee.com
        - productIdentifier: The In App Purchase product identifier you've configured on App Store Connect
     */
    public func configure(with username: String, and productIdentifier: String) {
        self.username = username
        
        guard SKPaymentQueue.canMakePayments() else {
            return
        }
        
        productsRequest?.cancel()
        productsRequest = SKProductsRequest(productIdentifiers: [productIdentifier])
        productsRequest?.delegate = self
        productsRequest?.start()
    }
    
    /**
     Start the donation flow on presenting view controller
     */
    @objc public func start() {
        guard presentingViewController != nil else {
            fatalError("presentingViewController must be set.")
        }
        
        guard SKPaymentQueue.canMakePayments(), let product = product else {
            return fallback()
        }
        
        let payment = SKPayment(product: product)
        paymentQueue.add(payment)
    }
    
    // MARK: - Private functions
    
    private override init() { }
    
    private func fallback() {
        guard let url = url else {
            return
        }
        
        let viewController = SFSafariViewController(url: url)
        viewController.preferredControlTintColor = BMCColor.default.background
        viewController.modalPresentationStyle = .formSheet
        presentingViewController?.present(viewController, animated: true)
    }
    
    // MARK: - SKProductsRequestDelegate
    
    public func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        product = response.products.first
        productsRequest = nil
    }
    
    // MARK: - SKPaymentTransactionObserver
    
    public func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchased:
                paymentQueue.finishTransaction(transaction)
            case .failed:
                fallback()
            case .restored:
                break
            case .deferred:
                break
            case .purchasing:
                break
            @unknown default:
                break
            }
        }
    }
}
