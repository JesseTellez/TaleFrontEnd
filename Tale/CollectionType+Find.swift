//
//  CollectionType+Find.swift
//  Tale
//
//  Created by Jesse Tellez on 8/7/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation

extension CollectionType {
    func find(@noescape predicate: (Self.Generator.Element) throws -> Bool) rethrows -> Self.Generator.Element? {
        return try indexOf(predicate).map({self[$0]})
    }
}
