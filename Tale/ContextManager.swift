//
//  ContextManager.swift
//  Tale
//
//  Created by Jesse Tellez on 8/2/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation


class ContextManager {
    
    static let sharedInstance = ContextManager()
    init(){}
    
    func getActiveAdditions(story: Story) -> LinkedList<Extension> {
        
        let res = LinkedList<Extension>()
        guard story.additionArray!.count > 0 else {
            return res
        }

        for i in 0 ..< story.uniqueIndiciesCount {
            
            let filtered: [Extension] = story.additionArray.filter({$0.indexRef == i})
            let maxAddition = getMaxAddition(filtered)
            res.insert(maxAddition, atIndex: i)
        }
        
        return res
    }
    
    private func getMaxAddition(addtions: [Extension]) -> Extension {
        
        var maxAddtion: Extension? = nil
        
        for i in 0 ..< addtions.count {
            if i == 0 {
                maxAddtion = addtions[i]
            }
            
            if addtions[i].votes > maxAddtion?.votes {
                maxAddtion = addtions[i]
            }
        }
        return maxAddtion!
    }
    
    private func decider(contextRef: String, additions: [Extension]) {
        //this needs to know the previous context -> Save this for later
    }
}