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
            
            var background: UIColor? {
                UIColor(named: rawValue)
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
            
            static let `default`: Self = .cookie
            
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
    
    convenience init(configuration: Configuration) {
        self.init(frame: .zero)
        
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
        layer.cornerRadius = 5
        
        configure(with: configuration)
    }
}
