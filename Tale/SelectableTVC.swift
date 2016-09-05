//
//  SelectableTVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/30/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class SelectableTVC: UITableViewCell {

    @IBOutlet weak var seletableLabel: UILabel!
    
    @IBOutlet weak var selectedImageView: UIImageView!
    
    var addition: Extension!
    
    func config(withContent content: Extension) {
        self.addition = content
        seletableLabel.text = content.content
        selectedImageView.hidden = true
        selectedImageView.tintColor = UIColor.greenColor()
    }
    
}
