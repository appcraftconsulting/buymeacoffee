//
//  ButtonTableViewCell.swift
//  CocoaPodsDemo
//
//  Created by François Boulais on 01/07/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import BuyMeACoffee
import UIKit

class ButtonTableViewCell: UITableViewCell {
    @IBOutlet private weak var button: BMCButton!
    
    func configure(withFont font: BMCFont, andColor color: BMCColor) {
        button.configuration = .init(color: color, font: font)
    }
}
