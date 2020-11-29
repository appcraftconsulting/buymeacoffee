//
//  BMCFontUI.swift
//  
//
//  Created by Campion Fellin on 11/28/20.
//

import SwiftUI

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public enum BMCFontUI: String, CaseIterable {
    case cookie
    case lato
    case arial
    
    public static let `default`: Self = .cookie
    
    internal var value: Font? {
        switch self {
        case .cookie:
            return Font.custom(rawValue.capitalized, size: 26)
        case .lato:
            return Font.custom(rawValue.capitalized, size: 20)
        case .arial:
            return Font.custom(rawValue.capitalized, size: 20)
        }
    }
}
