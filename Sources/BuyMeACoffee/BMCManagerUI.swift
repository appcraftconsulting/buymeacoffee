//
//  SwiftUIView.swift
//  
//
//  Created by Campion Fellin on 11/28/20.
//

#if !os(macOS)
import SwiftUI
import SafariServices
import StoreKit
import UIKit

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public struct SafariView: UIViewControllerRepresentable {

    let url: URL

    public func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {

    }
}

@available(iOS 13.0, *)
@available(OSX 10.15, *)
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

@available(iOS 13.0, *)
public final class BMCManagerUI: NSObject, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    public static let shared = BMCManagerUI()
    
    // MARK: - Public properties
    
    /// This text is displayed to supporters immediately after they make a payment.
    public var thankYouMessage: String?
    
    // MARK: - Internal properties
    
    internal var product: SKProduct?

    // MARK: - Private properties
    
    private var username = "appcraftstudio"
    private var productsRequest: SKProductsRequest?
    @State private var isAnimating = true
    
    public var fallbackSafariView: SafariView?

    private lazy var loadingView: ActivityIndicator = {
        let activityIndicatorView: ActivityIndicator
        activityIndicatorView = ActivityIndicator(isAnimating: self.$isAnimating, style: .large)

        return activityIndicatorView
    }()

    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(username))
    }
        
    // MARK: - Public functions
    
    /**
     Configure the manager for future donation requests.
     - parameters:
        - username: The username you've chosen on www.buymeacoffee.com.
     */
    public func configure(username: String) {
        self.username = username
        
        guard SKPaymentQueue.canMakePayments() else {
            return
        }
        
        if let productIdentifier = Bundle.main.bundleIdentifier?.appending(".buymeacoffee") {
            productsRequest?.cancel()
            productsRequest = SKProductsRequest(productIdentifiers: [productIdentifier])
            productsRequest?.delegate = self
            productsRequest?.start()
        }
    }
    
    /**
     Start the donation flow on presenting view controller.
     */
    @objc public func start() {
        guard SKPaymentQueue.canMakePayments(), let product = product else {
            return fallback()
        }

        let payment = SKPayment(product: product)
        SKPaymentQueue.default().add(self)
        SKPaymentQueue.default().add(payment)
    }
    
    // MARK: - Private functions
    
    private override init() { }
    
    // Not yet fully implemented
    private func fallback() {
        guard let url = url else {
            return
        }

        self.fallbackSafariView = SafariView(url: url)
    }
    
    private func showPurchasedMessage() {
        let message = thankYouMessage ?? "Thank you for supporting 🎉"
        let alertController = UIAlertController(title: "Buy Me a Coffee", message: message, preferredStyle: .alert)
    
        alertController.view.tintColor = BMCColor.default.background
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
                SKPaymentQueue.default().finishTransaction(transaction)
            case .restored:
                break
            case .deferred:
                break
            case .purchasing:
                break
            case .failed:
                break
            @unknown default:
                break
            }
        }
    }
    
    public func paymentQueue(_ queue: SKPaymentQueue, shouldAddStorePayment payment: SKPayment, for product: SKProduct) -> Bool {
        true
    }
}
#endif
