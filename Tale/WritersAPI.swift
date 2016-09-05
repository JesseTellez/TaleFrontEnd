//
//  WritersAPI.swift
//  Tale
//
//  Created by Jesse Tellez on 7/7/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation
import Moya
import Alamofire

protocol TaleApiType {
    var addXAuth: Bool {get}
}

enum WritersAPI {
    
    case Auth(email: String, password: String)
    case CreateUser(email: String, password: String, username: String)
    
    //UserStuff
    case Logout(userId: String)
    case StoryUpvote(userId: String, storyId: String)
    
    
    //the body dictionary can be used to hold the owner and the actual text
    case CreateExtension(parentStoryId: String, body: [String: AnyObject])
    case CreateStory(body: [String:AnyObject])
    case DeleteStory(storyId: String)
    case DeleteExtension(parentStoryId: String, extensionId: String)
    case Unfollow(userId: String)
    
    case FindFollows(contacts: [User])
    case PromoteStory(storyId: String)
    
    case GetStoryDetial(storyParam: String, extensionCount: Int)
    case GetStoryFollowers(storyId: String)
    case GetExtensionDetial(extensionId: String, upvoteCount: Int)
    
    case ProfileDelete
    case CurrentUserProfile
    case CurrentUserStories
    
}

//extension WritersAPI {
//    
//    var path: String {
//        
//    }
//}