//
//  SwiftUIView.swift
//  
//
//  Created by Campion Fellin on 11/28/20.
//
#if !os(macOS)
import SwiftUI
import StoreKit

@available(iOS 13.0, *)
@available(OSX 10.15, *)
public struct BMCButtonUI: View {
    @State private var presentFallback = false

    public struct Configuration {
        let color: BMCColor
        let font: BMCFont
        let title: String
        
        public init(color: BMCColor, font: BMCFont, title: String = "Buy me a coffee") {
            self.color = color
            self.font = font
            self.title = title
        }
        
        public static let `default`: Self = .init(color: .default, font: .default)
    }
    
    public var configuration: Configuration = .default {
        didSet {
            configure(with: configuration)
        }
    }
    
    private mutating func configure(with configuration: Configuration) {
        image = configuration.color.cup! as? Image
        
        backgroundColor = configuration.color.background! as? Color
        
        var title = configuration.title
        if let product = BMCManagerUI.shared.product {
            numberFormatter.locale = product.priceLocale
            if let price = numberFormatter.string(from: product.price) {
                title.append(" (\(price))")
            }
        }
    }
    
    let color: BMCColor?
    let font: BMCFont?
    let title: String?
    var image: Image?
    var backgroundColor: Color?
    
    private lazy var numberFormatter: NumberFormatter = {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter
    }()

    public init(color: BMCColor, font: BMCFont, title: String = "Buy me a coffee") {
        self.color = color
        self.font = font
        self.title = title
        self.image = configuration.color.cup as? Image

        configure(with: configuration)

        registerFonts()
    }
    
    public var body: some View {
        VStack {
            Button(action: {
                BMCManagerUI.shared.start()
                let payment = SKPayment(product: BMCManagerUI.shared.product!)
                SKPaymentQueue.default().add(payment)
            }) {
                self.image.padding(EdgeInsets(top: 0, leading: -6, bottom: 0, trailing: 6))
                Text(self.title!).padding(EdgeInsets(top: 0, leading: 6, bottom: 0, trailing: -6)).font(configuration.font.value as? Font).foregroundColor(configuration.color.title as? Color)
            }.padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)).background(self.backgroundColor).cornerRadius(5).shadow(color: Color.black, radius: 2, x: 4, y: 4)
        }
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

#endif
