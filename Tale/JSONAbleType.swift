//
//  JSONAbleType.swift
//  Tale
//
//  Created by Jesse Tellez on 8/1/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

protocol JSONAbleType {
    static func fromJSON(_: [String:AnyObject]) -> Self
}
