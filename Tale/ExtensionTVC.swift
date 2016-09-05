//
//  ExtensionTVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/21/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class ExtensionTVC: UITableViewCell {

    
    @IBOutlet weak var extensionLabel: UILabel!
    var addition1: Extension!
    
    func configureCell(withText: String) {
        extensionLabel.text = withText
    }
    
    func configureCellWithAddition(addition: Extension) {
        extensionLabel.text = addition.content
        addition1 = addition
        
    }
    
}
