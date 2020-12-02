//
//  BMCColor.swift
//
//  Created by François Boulais on 30/06/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

#if canImport(UIKit)
import UIKit
#if canImport(SwiftUI)
import SwiftUI
#endif

protocol CustomColor { }

extension UIColor: CustomColor { }
@available(iOS 13.0, OSX 10.15, *)
extension Color: CustomColor { }

protocol CustomImage { }

extension UIImage: CustomImage { }
@available(iOS 13.0, OSX 10.15, *)
extension Image: CustomImage { }

public enum BMCColor: String, CaseIterable {
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
    
    internal var background: CustomColor? {
        if #available(iOS 13.0, OSX 10.15, *) {
            return Color(UIColor(named: rawValue, in: .module, compatibleWith: nil)!)
        } else {
            return UIColor(named: rawValue, in: .module, compatibleWith: nil)
        }
    }
    
    internal var title: CustomColor {
        switch self {
        case .orange, .purple, .black, .blue, .green, .red, .pink:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Color.white
            } else {
                return UIColor.white
            }
        case .yellow, .white:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Color.black
            } else {
                return UIColor.black
            }
        }
    }
    
    internal var cup: CustomImage? {
        switch self {
        case .yellow:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Image(uiImage: UIImage(named: "cup-white", in: .moduleUI, compatibleWith: nil)!)
            } else {
                return UIImage(named: "cup-white", in: .module, compatibleWith: nil)
            }
        default:
            if #available(iOS 13.0, OSX 10.15, *) {
                return Image(uiImage: UIImage(named: "cup-yellow", in: .moduleUI, compatibleWith: nil)!)
            } else {
                return UIImage(named: "cup-yellow", in: .module, compatibleWith: nil)
            }
        }
    }
}
#endif
