//
//  BMCButton.swift
//
//
//  Created by François Boulais on 26/06/2020.
//

import UIKit

@IBDesignable
class BMCButton: UIButton {
    struct Configuration {
        enum Color: String {
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
            
            var background: UIColor {
                switch self {
                case .orange:
                    return #colorLiteral(red: 1, green: 0.5059999824, blue: 0.2469999939, alpha: 1)
                case .yellow:
                    return #colorLiteral(red: 1, green: 0.8669999838, blue: 0, alpha: 1)
                case .purple:
                    return #colorLiteral(red: 0.7409999967, green: 0.3729999959, blue: 1, alpha: 1)
                case .black:
                    return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                case .white:
                    return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                case .blue:
                    return #colorLiteral(red: 0.3729999959, green: 0.4979999959, blue: 1, alpha: 1)
                case .green:
                    return #colorLiteral(red: 0.474999994, green: 0.8389999866, blue: 0.7099999785, alpha: 1)
                case .red:
                    return #colorLiteral(red: 1, green: 0.3729999959, blue: 0.3729999959, alpha: 1)
                case .pink:
                    return #colorLiteral(red: 0.9570000172, green: 0.4429999888, blue: 1, alpha: 1)
                }
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
        
        enum Font {
            case cookie
            case lato
            case arial
            
            static let `default`: Self = .arial
            
            var value: UIFont? {
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
        
        var color: Color = .default
        var font: Font = .default
        var title: String = "Buy me a coffee"
        var username: String = "appcraftstudio"
    }
    
    var presentingViewController: UIViewController?
    var delegate: BMCButtonDelegate?
    
    var configuration = Configuration() {
        didSet {
            configure(with: configuration)
        }
    }
    
    override var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.85 : 1
        }
    }
    
    convenience init(configuration: Configuration) {
        self.init(type: .custom)
        
        self.configuration = configuration
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let rect = bounds.insetBy(dx: 5, dy: 5)
        let cornerRadii = CGSize(width: 5, height: 5)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: cornerRadii)
        layer.shadowPath = path.cgPath
    }
    
    // MARK: - Interface Builder
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        configure(with: configuration)
    }
    
    // MARK: - Private functions
    
    private func configure(with configuration: Configuration) {
        titleLabel?.font = configuration.font.value
        setTitle(configuration.title, for: .normal)
        setTitleColor(configuration.color.title, for: .normal)
        backgroundColor = configuration.color.background
    }
    
    private func setup() {
        layer.shadowOffset = .init(width: 0, height: 1)
//        layer.shadowColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 0.005).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 1
        layer.cornerRadius = 5

        contentEdgeInsets = .init(top: 7, left: 15, bottom: 7, right: 10)
        configure(with: configuration)
    }
}
