//
//  RelationshipState.swift
//  Tale
//
//  Created by Jesse Tellez on 7/7/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation


public enum RelationshipState: String {
    
    case Following = "Friend"
    case Block = "Block"
    case Mute = "Mute"
    case None = "None"
    case Me = "Self"
    case Liked = "Like"
    //need to add more states
    case Contributer = "Contributer"
    
    static let all = [Following, Block, Mute, None, Me, Liked]
    
    public init(strValue: String) {
        self = RelationshipState(rawValue: strValue) ?? .None
    }
    
    var buttonName: String {
        switch self {
        case .Liked:
            return "Liked"
        default:
            return self.rawValue
        }
    }
    
    var isMutedOrBlocked: Bool {
        switch self {
        case .Mute, .Block:
            return true
        default:
            return false
        }
    }
}


