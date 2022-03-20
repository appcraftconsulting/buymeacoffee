//
//  BMCButtonUIViewRepresentable.swift
//
//  Created by Dan Hart on 3/20/22.
//

import Foundation
#if canImport(SwiftUI)
import SwiftUI

@available(iOS 13.0, *)
struct BMCButtonUIViewRepresentable: UIViewRepresentable {
    public typealias UIViewType = BMCButton
    
    var username: String
    var configuration: BMCButton.Configuration?
    var presentingViewController: UIViewController?
    
    func makeUIView(context: Context) -> BMCButton {
        BMCManager.shared.configure(username: username)
        BMCManager.shared.presentingViewController = presentingViewController

        return BMCButton()
    }
    
    func updateUIView(_ uiView: BMCButton, context: Context) {
        if let configuration = configuration {
            uiView.configure(with: configuration)
        }
    }
}

#endif
