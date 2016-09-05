//
//  SpotlightCVC.swift
//  Tale
//
//  Created by Jesse Tellez on 7/21/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class SpotlightCVC: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var storyImage: UIImageView!
    
    func configureCell(withStory: Story) {
        titleLabel.text = withStory.title
        storyImage.image = withStory.image
    }
}
