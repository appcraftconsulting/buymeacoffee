//
//  File.swift
//  
//
//  Created by François Boulais on 30/06/2020.
//

import UIKit
import WebKit

internal class BMCViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet private weak var webView: WKWebView!
        
    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(BMCManager.shared.username))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        webView.navigationDelegate = self
        
        if let url = url {
            webView.load(.init(url: url))
            title = url.host
        }
    }
    
    // MARK: - WKNavigationDelegate
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url == url, navigationAction.navigationType == .linkActivated {
            dismiss(animated: true, completion: nil)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    // MARK: - Interface Builder
    
    @IBAction private func cancel() {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func reload() {
        webView.reload()
    }
}
