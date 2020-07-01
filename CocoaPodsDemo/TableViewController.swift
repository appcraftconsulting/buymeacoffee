//
//  TableViewController.swift
//  CocoaPodsDemo
//
//  Created by François Boulais on 01/07/2020.
//  Copyright © 2020 App Craft Studio. All rights reserved.
//

import BuyMeACoffee
import UIKit

class TableViewController: UITableViewController, BMCDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        BMCManager.shared.presentingViewController = self
        BMCManager.shared.delegate = self
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        BMCFont.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        BMCColor.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        BMCFont.allCases[section].rawValue
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "button-cell", for: indexPath)
        
        if let cell = cell as? ButtonTableViewCell {
            let font = BMCFont.allCases[indexPath.section]
            let color = BMCColor.allCases[indexPath.row]
            cell.configure(withFont: font, andColor: color)
        }
        
        return cell
    }
    
    // MARK: - BMCDelegate
    
    func bmcViewControllerDidCancel(_ bmcViewController: BMCViewController) {
        bmcViewController.dismiss(animated: true, completion: nil)
    }
    
    func bmcViewControllerDidSucceed(_ bmcViewController: BMCViewController) {
        bmcViewController.dismiss(animated: true, completion: nil)
    }
}

