//
//  MoviesModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol MoviesModelType {
    
    func items(_ completionHandler: @escaping (_ items: [DataItem]) -> Void)
}

struct MoviesModel: MoviesModelType {
    
    private var items = [DataItem]()
    
    init() {
        createDataItems()
    }
    
    private mutating func createDataItems() {
        
        items.append(DataItem(id: 1, title: "Test 1", score: 9.1, posterUrl: "url"))
        items.append(DataItem(id: 1, title: "Test 2", score: 8.7, posterUrl: "url"))
        print("Itemki się tworzą, mam ich: \(items.count)")
    }
    
    func items(_ completionHandler: @escaping ([DataItem]) -> Void) {
        
        DispatchQueue.global().async {
            completionHandler(self.items)
        }
    }
    
    
}
