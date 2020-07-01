//
//  BMCColor.swift
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import UIKit

public enum BMCColor: String {
    case orange
    case yellow
    case purple
    case black
    case white
    case blue
    case green
    case red
    case pink
    
    public static let `default`: Self = .orange
    
    internal var background: UIColor? {
        UIColor(named: rawValue, in: .module, compatibleWith: nil)
    }
    
    internal var title: UIColor {
        switch self {
        case .orange, .purple, .black, .blue, .green, .red, .pink:
            return .white
        case .yellow, .white:
            return .black
        }
    }
}
