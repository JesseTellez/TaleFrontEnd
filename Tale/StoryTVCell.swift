//
//  StoryTVCell.swift
//  Tale
//
//  Created by Jesse Tellez on 9/3/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

class StoryTVCell: UITableViewCell {

    @IBOutlet weak var storyTitle: UILabel!
    @IBOutlet weak var bookMarksLabel: UILabel!
    @IBOutlet weak var additionsLabel: UILabel!
    @IBOutlet weak var recentUserImageOne: UIImageView!
    @IBOutlet weak var recentUserImageTwo: UIImageView!
    @IBOutlet weak var recentUserImageThree: UIImageView!
    @IBOutlet weak var recentUserImageFour: UIImageView!
    
    func configureCell(story: Story) {
        storyTitle.text = story.title
        bookMarksLabel.text = "29 Bookmarks"
        additionsLabel.text = "5 Additions"
        recentUserImageOne.image = UIImage(named: "profile.jpg")
        recentUserImageTwo.image = UIImage(named: "profile.jpg")
        recentUserImageThree.image = UIImage(named: "profile.jpg")
        recentUserImageFour.image = UIImage(named: "profile.jpg")
        
        
    }
}
