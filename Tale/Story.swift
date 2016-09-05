//
//  Story.swift
//  Tale
//
//  Created by Jesse Tellez on 7/7/16.
//  Copyright © 2016 Inspir. All rights reserved.
//
import UIKit
import Foundation

/*
 Algorithm: (link lists will allow me to change pointers, not just copy data arrond
 -> make the active additions a linked list
 -> when a new addition is added to an empty story:
    -> this new addition is set at index 1
 -> for a list of multiple elements:
    -> the first slot refers the base
    -> the second slot refers the first (index 1)
    -> if the first slot changes (if the content here changes):
        -> Ways it can change == new addition at index 1 OR chooser analyzes this index and selects a diff one (one may be removed later)
        -> have the "chooser" choose what the second slot (index) needs to change to if it even does
 
 */

public enum StoryType: String {
    case Standard = "Standard"
    case Challange = "Challange Story"
    case Live = "Live"
    case AI = "AI"
}


public class Story {
    
    let manager = ContextManager.sharedInstance
    
    //STANDARD
    let title: String!
    let base: Extension!
    let image: UIImage?
    let category: Category!
    let storyType: StoryType
    var id: String!
    var isTrending: Bool {
        return false
    }
    
    //an addition must be made in the database to ensure a user has not voted more than once
    var numberOfExtensions: Int? {
        if additionArray != nil && additionArray.count > 0 {
            return additionArray.count
        }
        return 0
    }
    
    var follow: Bool
    var rating: Int?
    //CHALLANGE
    //since we are denormalizing the database, this feild will be wasted Space for most stories
    //done throught a join table
    var wordsToInclude: [String]? {
        get {
            switch self.storyType {
            case .Standard:
                return nil
            case .Challange:
                return ["Something", "How", "Am I Going to do this"]
            case.AI:
                return nil
            case .Live:
                return nil
            }
        }
    }
    
    //LIVE
    var otherUsers: [User]?
    //each user will have their own additions....these will go in the additionArray
    
    //AI
    //if its an ai story it will just have to interface with node -> apache Spark
    
    //the story owner is the same as the base owner
    let owner: User?
    
    var additionArray: [Extension]!
    //this might be getting called waaaaaaaay too much
    //activeAdditions can be something that I only calculate the client side for now
    var activeAdditions: LinkedList<Extension>? {
        //i have to make sure that the addition array is filled for this
        if additionArray.count <= 0 {
            return LinkedList<Extension>()
        }
        return getActiveAdditions()
    }
    
    var uniqueIndiciesCount: Int {
       
        if additionArray.count <= 0 {
            return 0
        }
        //let sortedAdditions = self.additionArray.sort({$0.indexRef < $1.indexRef})
        var indexArray = [Int]()
        for something in self.additionArray {
            indexArray.append(something.indexRef)
        }
        
        return Set(indexArray).count
        //let distinictIndexRefs = Set(self.additionArray.map({$0.indexRef})).count
    }

    //this is a helper init for development
    init(title: String, _ image: UIImage?, _ base: Extension, category: Category, owner: User?) {
        //new story, not one that we get back from the database
        self.title = title
        self.base = base
        self.image = image
        self.category = category
        self.id = Story.generateUUID()
        self.owner = owner
        self.additionArray = []
        //this is just for now
        self.storyType = .Standard
        self.follow = true
    }
    
    class func createGenericStories() -> [Story] {
        
        var res: [Story] = []
        
        let exampleUser = User(name: "Boob")
        let base = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        let baseAddition = Extension(owner: exampleUser, nil, base)
        
        for i in 0 ..< 10 {
            let newStory = Story(title: "Test \(i)", UIImage(named: "romance.jpg"), baseAddition, category: .Romance, owner: exampleUser)
            res.append(newStory)
        }
        
        return res
    }
    
    func addAddition(addition: Extension) {
       additionArray.append(addition)
    }
    
    func findAllExtensionsWithIndex(indexRef: Int) -> [Extension]? {
        guard additionArray.count > 0 else {
            return nil
        }
        return additionArray.filter({$0.indexRef == indexRef})
    }
    
    func findAllAdditionsWithException(indexRef: Int, exception: Extension) -> [Extension] {
        
        var res = [Extension]()
        
        guard additionArray.count > 0 else {
            return res
        }
        
        for i in 0 ..< additionArray.count {
            
            if additionArray[i].uuid == exception.uuid {
                continue
            }
            
            if additionArray[i].indexRef == indexRef {
                res.append(additionArray[i])
            }
        }
        return res
    }
    
    private func getActiveAdditions() -> LinkedList<Extension> {
        return manager.getActiveAdditions(self)
        
    }
    
    private class func generateUUID() -> String {
        let uuid = NSUUID().UUIDString
        return uuid
    }
}