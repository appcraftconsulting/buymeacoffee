//
//  BMCButton.swift
//
//
//  Created by François Boulais on 26/06/2020.
//

import UIKit

@IBDesignable
public class BMCButton: UIButton {
    struct Configuration {
        var color: BMCColor = .default
        var font: BMCFont = .default
        var title: String = "Buy me a coffee"
        var username: String = "appcraftstudio"
    }
    
    var configuration = Configuration() {
        didSet {
            configure(with: configuration)
        }
    }
    
    public override var isHighlighted: Bool {
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
    
    // MARK: - Interface Builder
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setup()
    }
    
    // MARK: - Private functions
    
    private func configure(with configuration: Configuration) {
        titleLabel?.font = configuration.font.value
        setTitle(configuration.title, for: .normal)
        setTitleColor(configuration.color.title, for: .normal)
        backgroundColor = configuration.color.background
    }
    
    private func setup() {
        layer.shadowOffset = .init(width: 5, height: 5)
        layer.shadowColor = UIColor.black.withAlphaComponent(0.15).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 2
        layer.cornerRadius = 5

        contentEdgeInsets = .init(top: 8, left: 24, bottom: 8, right: 24)
        titleEdgeInsets = .init(top: 0, left: 6, bottom: 0, right: -6)
        imageEdgeInsets = .init(top: 0, left: -6, bottom: 0, right: 6)
        let image = UIImage(named: "bmc", in: .module, compatibleWith: nil)
        setImage(image, for: .normal)
        
        registerFonts()
        
        adjustsImageWhenHighlighted = false
        
        addTarget(BMCManager.shared, action: #selector(BMCManager.shared.present), for: .touchUpInside)
        
        configure(with: configuration)
    }
    
    private func registerFonts() {
        if let url = Bundle.module.url(forResource: "Cookie-Regular", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
        
        if let url = Bundle.module.url(forResource: "Lato-Regular", withExtension: "ttf") {
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }
}
