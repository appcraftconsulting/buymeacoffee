//
//  UIApplication+topmostViewController.swift
//
//  Created by Dan Hart on 3/20/22.
//

import Foundation
#if canImport(UIKit)
import UIKit

@available(iOS 13.0, *)
extension UIApplication {
    var keyWindow: UIWindow? {
        // Get connected scenes
        return UIApplication.shared.connectedScenes
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
        // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
    
    var topmostViewController: UIViewController? {
        if var topController = keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            
            return topController
        }
        
        return nil
    }
}
#endif
