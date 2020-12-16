//
//  BMCFont.swift
//  
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public enum BMCFont: String, CaseIterable {
    case cookie
    case lato
    case arial
    
    public static let `default`: Self = .cookie
    
    internal var value: UIFont? {
        switch self {
        case .cookie:
            return UIFont(name: rawValue.capitalized, size: 26)
        case .lato:
            return UIFont(name: rawValue.capitalized, size: 20)
        case .arial:
            return UIFont(name: rawValue.capitalized, size: 20)
        }
    }
}
#endif
