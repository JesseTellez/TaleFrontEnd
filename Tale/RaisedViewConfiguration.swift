//
//  RaisedViewConfiguration.swift
//  Tale
//
//  Created by Jesse Tellez on 7/19/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import UIKit


public struct RaisedViewConfiguration {
    
    public var viewBackgroundColor: UIColor?
    public var tableViewTextFont: UIFont?
    public var tableViewTextColor: UIColor?
    public init() {}
    
    public static func defaultConfiguration() -> RaisedViewConfiguration {
        
        var config = RaisedViewConfiguration()
        let lightGreenColor = UIColor(red: 102/255, green: 204/255, blue: 101/255, alpha: 0.8)
        config.viewBackgroundColor = lightGreenColor
        config.tableViewTextColor = UIColor.whiteColor()
        config.tableViewTextFont = UIFont(name: "Helvetica", size: 15)
        
        return config
    }
    
}
