//
//  Categories.swift
//  Tale
//
//  Created by Jesse Tellez on 7/17/16.
//  Copyright © 2016 Inspir. All rights reserved.
//

import Foundation

public enum Category: String {
    
    case Comedy = "Comedy"
    case Adventure = "Adventure"
    case Action = "Action"
    case Romance = "Romance"
    case Horror = "Horror"
    case Drama = "Drama"
    case Triller = "Triller"
    case Mystery = "Mystery"
    case Fantasy = "Fantasy"
    case ScienceFiction = "Science Fiction"
    
    static var categoryArray: [Category] {
        get  {
            return [
                .Comedy, .Adventure, .Action, .Romance, .Horror, .Drama, .Triller, .Mystery, .Fantasy, .ScienceFiction
            ]
        }
    }
}