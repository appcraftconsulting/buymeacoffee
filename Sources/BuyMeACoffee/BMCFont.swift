//
//  BMCFont.swift
//  
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

protocol CustomFont { }

extension UIFont: CustomFont { }
@available(iOS 13.0, OSX 10.15, *)
extension Font: CustomFont { }

public enum BMCFont: String, CaseIterable {
    case cookie
    case lato
    case arial
    
    public static let `default`: Self = .cookie
    
    internal var value: CustomFont? {
        switch self {
        case .cookie:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Font.custom(rawValue.capitalized, size: 26)
            } else {
                return UIFont(name: rawValue.capitalized, size: 26)
            }
        case .lato:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Font.custom(rawValue.capitalized, size: 20)
            } else {
                return UIFont(name: rawValue.capitalized, size: 20)
            }
        case .arial:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Font.custom(rawValue.capitalized, size: 20)
            } else {
                return UIFont(name: rawValue.capitalized, size: 20)
            }
        }
    }
}
#endif
