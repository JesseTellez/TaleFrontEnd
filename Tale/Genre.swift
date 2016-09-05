//
//  Genre.swift
//  Tale
//
//  Created by Jesse Tellez on 8/30/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit

public enum GenreSelector: String {
    case Fantasy = "fantasy.jpg"
    case Horror = "horror.jpg"
    case Romance = "romance.jpg"
    case Comedy = "comedy.jpg"
    case Action = "action.jpg"
    case Adventure = "adventure.jpg"
    case Drama = "drama.jpg"
    case Mystery = "mystery.jpg"
}

class Genre: NSObject {
    //this class will poll the database for changes
    
    let title: String!
    var storiesCount: Int! {
        return self.getStoriesCount()
    }
    var readersCount: Int! {
        
        return self.getReadersCount()
    }
    var storiesArray: [Story]
   // private let imageSelector: GenreSelector
    let image: UIImage!
    
    init(title: String, stories: [Story], genre: GenreSelector) {
        self.title = title
        self.storiesArray = stories
        self.image = UIImage(named: "fantasy.jpg")
    }

    
    
    private func getReadersCount() -> Int {
        
        return 5
        
    }
    
    private func getStoriesCount() -> Int {
        
        return 459
    }
    
    
}

