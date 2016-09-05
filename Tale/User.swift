//
//  User.swift
//  Tale
//
//  Created by Jesse Tellez on 7/7/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation
import SwiftyJSON


//final prevents overrides
final class User: NSObject, JSONAbleType {
    
    var username: String
    var id: String?
    var email: String?
    var location: String?
    var bio: String
    
    init(name: String) {
        self.username = name
        self.id = nil
        self.email = nil
        self.location = nil
        self.bio = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."
    }
    
    static func fromJSON(json: [String: AnyObject]) -> User {
        
        let json = JSON(json)
        let name = json["username"].stringValue
//        let email = json["email"].stringValue
//        let id = json["id"].stringValue
//        let location = json["location"].stringValue
        
        //set this up later
        
        return User(name: name)
    }
    
//    private let _id: String!
//    private let _username: String!
//    private let _name: String!
//    private let _password: String!
//    private var _relationshipState: RelationshipState
//    public let flaggedForBadContent: Bool
//    public var hasWritingEnabled: Bool
//    public var hasWritingPrivleges: Bool
//    
//    public var avatar: String?
//    public var storiesAuthoredCount: Int?
//    public var storyAdditionsCount: Int?
//    public var followedStoriesCount: Int?
//    public var storyNotificationsCount: Int?
//    public var followersCount: Int?
//    public var shortBio: String?
//    
//    
//    
//    public var storySegments: [String: String] {
//        //return something from here...segments must be mapped to a story
//        return Dictionary()
//    }
//    
//    public var mostRecentSegments: [String : String]
//    
//    //maybe some stuff for the interpreter later?
//    init() {
//        
//    }
}