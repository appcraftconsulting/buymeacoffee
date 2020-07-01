//
//  BMCFont.swift
//  
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import UIKit

public enum BMCFont {
    case cookie
    case lato
    case arial
    
    public static let `default`: Self = .cookie
    
    internal var value: UIFont? {
        switch self {
        case .cookie:
            return UIFont(name: "Cookie", size: 28)
        case .lato:
            return UIFont(name: "Lato", size: 20)
        case .arial:
            return UIFont(name: "Arial", size: 20)
        }
    }
}
