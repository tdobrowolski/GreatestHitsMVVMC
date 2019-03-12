//
//  DataItem.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct DataItem: Decodable {
    
    let id: Int
    let title: String
    let score: Double
    let posterUrl: String
    
    var overview: String? = nil
    var genres: [Genre]? = nil
    var releaseDate: String? = nil
    var revenue: Int? = nil
    
    init(id: Int, title: String, score: Double, posterUrl: String) {
        
        self.id = id
        self.title = title
        self.score = score
        self.posterUrl = posterUrl
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case score = "vote_average"
        case posterUrl = "poster_path"
        case overview = "overview"
        case genres = "genres"
        case releaseDate = "release_date"
        case revenue = "revenue"
    }
    
}

struct Genre: Decodable {
    let id: Int
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}

struct MoviesResult: Decodable {
    
    var page, totalPages: Int
    var results: [DataItem]
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
    }
    
}
