//
//  DataItem.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol DataItemType {
    
    var id: Int { get }
    var title: String { get }
    var score: Double { get }
    var posterUrl: String { get }
}

struct DataItem: DataItemType {
    
    let id: Int
    let title: String
    let score: Double
    let posterUrl: String
    
    init(id: Int, title: String, score: Double, posterUrl: String) {
        
        self.id = id
        self.title = title
        self.score = score
        self.posterUrl = posterUrl
    }
    
}
