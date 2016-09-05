//
//  DataManager.swift
//  Tale
//
//  Created by Jesse Tellez on 8/30/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation
import UIKit

public class DataManager {
    
    static let sharedInstance = DataManager()
    init(){}
    
    func getFilteredStoriesFromServer(withFilter: String) -> [Story] {
        return Story.createGenericStories()
    }
    
    func getCurrentTrendingStories() -> [Story] {
        
        //get current trending stories from the server
        
        return []
        
    }
    
    
    func getStoriesForGenre(genre: Genre) -> [Story] {
        //search Stories table where the genre id matches the one given
        let exampleUser = User(name: "Tit Fuck")
        
        let exampleText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let baseExtension = Extension(owner: exampleUser, nil, exampleText)
        
        let someStory = Story(title: "Kingdom Amalor", UIImage(named: "fantasy.jpg"), baseExtension, category: .Adventure, owner: baseExtension.owner)
        let someStory2 = Story(title: "The Basement Key", UIImage(named: "horror.jpg"), baseExtension, category: .Horror, owner: baseExtension.owner)
        let someStory3 = Story(title: "Loves First Sight", UIImage(named: "romance.jpg"), baseExtension, category: .Romance, owner: baseExtension.owner)
        let someStory4 = Story(title: "Simon's Path", UIImage(named: "mystery.jpg"), baseExtension, category: .Mystery, owner: baseExtension.owner)
        let someStory5 = Story(title: "Cloverfield", UIImage(named: "UFO.jpg"), baseExtension, category: .ScienceFiction, owner: baseExtension.owner)
        
        let trendingStories = [someStory, someStory2, someStory3, someStory4, someStory5]
        return trendingStories
        
    }
    
    func getGenres() -> [Genre] {
        //if RequestManager.exists.....then make a new request
        //ELSE:
        var baseGenreArray = [Genre]()
        
        let fantasy = Genre(title: "Fantasy", stories: randomArrayOfStories(), genre: .Fantasy)
        let horror = Genre(title: "Horror", stories: randomArrayOfStories(), genre: .Horror)
        let romance = Genre(title: "Romance", stories: randomArrayOfStories(), genre: .Romance)
        let comedy = Genre(title: "Comedy", stories: randomArrayOfStories(), genre: .Romance)
        let action = Genre(title: "Action", stories: randomArrayOfStories(), genre: .Romance)
        let adventure = Genre(title: "Adventure", stories: randomArrayOfStories(), genre: .Romance)
        let drama = Genre(title: "Drama", stories: randomArrayOfStories(), genre: .Romance)
        let mystery = Genre(title: "Mystery", stories: randomArrayOfStories(), genre: .Romance)
        
        baseGenreArray = [fantasy, horror, romance, comedy, action, adventure, drama, mystery]
        return baseGenreArray
    }
    
    private func randomArrayOfStories() -> [Story] {
        let exampleUser = User(name: "Tit Fuck")
        let base = Extension(owner: exampleUser, nil, "This is the most Solid base ever lol")
        
        var storyArray = [Story]()
        
        for i in 0 ..< 6 {
            
            let newStory = Story(title: "Best Story Ever", UIImage(named: ""), base, category: .Romance, owner: exampleUser)
            storyArray.append(newStory)
        }
        
        return storyArray
    }
    
}
