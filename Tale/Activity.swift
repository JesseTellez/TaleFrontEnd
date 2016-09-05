//
//  Activity.swift
//  Tale
//
//  Created by Jesse Tellez on 8/16/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation

//An activity can be created during any user action in the application

public class Activity {
    
    //an id is auto create
    //private var _id: String
    var title: String!
    var notification: String!
    var createdAt: String!
    
    init(title: String, notification: String) {
        //may want to change the notification stuff later to a enum
        self.title = title
        self.notification = notification
        //self.createdAt = getCurrentTimeStamp()
        let components = getCurrentTimeStamp()
        self.createdAt = "Created At: \(components.month), \(components.year) \(components.hour):\(components.minute)"
    }
    
    private func getCurrentTimeStamp() -> NSDateComponents {
        
        let createdDate = NSDate()
        let userCalender = NSCalendar.currentCalendar()
        
        let requestedComponents:NSCalendarUnit = [
            NSCalendarUnit.Year,
            NSCalendarUnit.Month,
            NSCalendarUnit.Hour,
            NSCalendarUnit.Minute
        ]
        
        let dateTimeComponents = userCalender.components(requestedComponents, fromDate: createdDate)
        
        //to access these now use createdDate/createdAt.year, createdAt.month....etc
        return dateTimeComponents
    }
    
    
}