//
//  BMCColor.swift
//  
//
//  Created by François Boulais on 30/06/2020.
//

import UIKit

enum BMCColor: String {
    case orange
    case yellow
    case purple
    case black
    case white
    case blue
    case green
    case red
    case pink
    
    static let `default`: Self = .orange
    
    var background: UIColor? {
        UIColor(named: rawValue, in: .module, compatibleWith: nil)
    }
    
    var title: UIColor {
        switch self {
        case .orange, .purple, .black, .blue, .green, .red, .pink:
            return .white
        case .yellow, .white:
            return .black
        }
    }
}
