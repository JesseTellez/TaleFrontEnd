//
//  Extension.swift
//  Tale
//
//  Created by Jesse Tellez on 7/21/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation


class Extension {
    
    //each extension must hold a reference to the possible extensions
    var parentReference: Extension?
    let content: String!
    let owner: User!
    let uuid: String!
    let dateAdded: NSDate!
    var indexRef: Int! {
        //this will not work in the context selection controller
        //if parentRefrence.indexRef != nil
        
        //NEED TO ACCOUNT FOR THE BASE

        if parentReference != nil {
           return parentReference!.indexRef + 1
        }
        return 0
    }
    
    var votes: Int = 0
    
    init(owner: User, _ contextRef: Extension?, _ content: String) {
        //if it has no context ref we can assume that it is the base story
        self.owner = owner
        if let ref = contextRef {
            self.parentReference = ref
        }else {
           self.parentReference = nil
        }
        self.content = content
        self.uuid = Extension.generateUniqueId()
        self.dateAdded = Extension.generateCurrentTime()
    }
    
    private class func generateUniqueId() -> String {
        let uuid = NSUUID().UUIDString
        return uuid
    }
    
    private class func generateCurrentTime() -> NSDate {
        return NSDate()
    }
    
    func iterateVotes() {
        self.votes += 1
    }

}