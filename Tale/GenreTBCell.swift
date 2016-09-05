//
//  GenreTBCell.swift
//  Tale
//
//  Created by Jesse Tellez on 8/31/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class GenreTBCell: UITableViewCell {

    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var storiesCountLabel: UILabel!
    @IBOutlet weak var readersCountLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    func configureCell(genre: Genre) {
        
        genreLabel.text = genre.title
        storiesCountLabel.text = "\(genre.storiesCount)"
        readersCountLabel.text = "\(genre.readersCount)"
        backgroundImage.image = UIImage(named: "fantasy.jpg")
        
    }
    
}
