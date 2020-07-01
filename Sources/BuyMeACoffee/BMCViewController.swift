//
//  File.swift
//  
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#endif

import WebKit

public class BMCViewController: UIViewController, WKNavigationDelegate, WKUIDelegate {
    @IBOutlet private weak var webView: WKWebView!
        
    private var url: URL? {
        URL(string: "https://www.buymeacoffee.com/".appending(BMCManager.shared.username))
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
                
        webView.navigationDelegate = self
        
        if let url = url {
            webView.load(.init(url: url))
            title = url.host
        }
    }
    
    // MARK: - WKNavigationDelegate
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if navigationAction.request.url == url, navigationAction.navigationType == .linkActivated {
            BMCManager.shared.delegate?.bmcViewControllerDidSucceed(self)
            decisionHandler(.cancel)
        } else {
            decisionHandler(.allow)
        }
    }
    
    // MARK: - Interface Builder
    
    @IBAction private func cancel() {
        BMCManager.shared.delegate?.bmcViewControllerDidCancel(self)
    }
    
    @IBAction private func reload() {
        webView.reload()
    }
}
