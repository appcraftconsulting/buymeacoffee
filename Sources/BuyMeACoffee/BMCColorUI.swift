//
//  SwiftUIView.swift
//  
//
//  Created by Campion Fellin on 11/28/20.
//

#if canImport(UIKit)
import SwiftUI
import UIKit

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public enum BMCColorUI: String, CaseIterable {
    case orange
    case yellow
    case purple
    case black
    case white
    case blue
    case green
    case red
    case pink
    
    public static let `default`: Self = .yellow
    
    internal var background: Color? {
        Color(UIColor(named: rawValue, in: .module, compatibleWith: nil)!)
    }
    
    internal var title: Color {
        switch self {
        case .orange, .purple, .black, .blue, .green, .red, .pink:
            return .white
        case .yellow, .white:
            return .black
        }
    }
    
    internal var cup: Image? {
        switch self {
        case .yellow:
            return Image(uiImage: UIImage(named: "cup-white", in: .moduleUI, compatibleWith: nil)!)
        default:
            return Image(uiImage: UIImage(named: "cup-yellow", in: .moduleUI, compatibleWith: nil)!)
        }
    }
}

#endif
