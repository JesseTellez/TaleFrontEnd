//
//  ContextDetailCell.swift
//  Tale
//
//  Created by Jesse Tellez on 8/8/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class ContextDetailCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var upvoteLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func configureCell(content: String) {
        
        contentLabel.text = content
        
    }

}
