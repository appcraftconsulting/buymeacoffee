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
    
    /// The view controller used to present donation flow.
    public var presentingViewController: UIViewController?
    
    /// This text is displayed to supporters immediately after they make a payment.
    public var thankYouMessage: String?
    
    // MARK: - Internal properties
    
    internal var product: SKProduct?

    // MARK: - Private properties
    
    private var username = "appcraftstudio"
    private var productsRequest: SKProductsRequest?
    
    private lazy var loadingViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.tintColor = BMCColor.default.background
        
        let activityIndicatorView: UIActivityIndicatorView
        if #available(iOS 13.0, *) {
            activityIndicatorView = UIActivityIndicatorView(style: .large)
        } else {
            activityIndicatorView = UIActivityIndicatorView(style: .whiteLarge)
        }
        
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicatorView.startAnimating()
        viewController.view.addSubview(activityIndicatorView)
        
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
        ])
        
        return viewController
    }()

    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(username))
    }
        
    // MARK: - Public functions
    
    /**
     Configure the manager for future donation requests.
     - parameters:
        - username: The username you've chosen on www.buymeacoffee.com.
        - productIdentifier: The In App Purchase product identifier you've configured on App Store Connect.
     */
    public func configure(username: String, productIdentifier: String? = nil) {
        self.username = username
        
        guard SKPaymentQueue.canMakePayments(), let productIdentifier = productIdentifier else {
            return
        }
        
        productsRequest?.cancel()
        productsRequest = SKProductsRequest(productIdentifiers: [productIdentifier])
        productsRequest?.delegate = self
        productsRequest?.start()
    }
    
    /**
     Start the donation flow on presenting view controller.
     */
    @objc public func start() {
        guard let presentingViewController = presentingViewController else {
            fatalError("presentingViewController must be set.")
        }
        
        guard SKPaymentQueue.canMakePayments(), let product = product else {
            return fallback()
        }
        
        presentingViewController.present(loadingViewController, animated: true) {
            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
            SKPaymentQueue.default().add(self)
        }
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
    
    private func showPurchasedMessage() {
        let message = thankYouMessage ?? "Thank you for supporting 🎉"
        let alertController = UIAlertController(title: "Buy Me a Coffee", message: message, preferredStyle: .alert)
        
        alertController.addAction(.init(title: "Close", style: .default, handler: { [weak self] _ in
            self?.loadingViewController.dismiss(animated: true)
        }))
        
        alertController.view.tintColor = BMCColor.default.background
        presentingViewController?.present(alertController, animated: true)
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
                showPurchasedMessage()
                paymentQueue.finishTransaction(transaction)
            case .failed:
                if (transaction.error as? SKError)?.code != .paymentCancelled {
                    loadingViewController.dismiss(animated: true) { [weak self] in
                        self?.fallback()
                    }
                }
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
