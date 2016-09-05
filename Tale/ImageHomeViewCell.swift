//
//  ImageHomeViewCell.swift
//  Tale
//
//  Created by Jesse Tellez on 8/30/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class ImageHomeViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(genre: String) {
        genreLabel.text = genre
    }
    
}