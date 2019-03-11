//
//  TopMoviesViewModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol TopMoviesViewModelType {
    
    func addStartItems()
}

final class TopMoviesViewModel: TopMoviesViewModelType {
    
    var items: [DataItem] = []
 
    init() {
        addStartItems()
    }
    
    func addStartItems() {
        print("Tworze nowe obiekty")
        items.append(DataItem(id: 1, title: "Tytuł filmu nr 1", score: 8.9, posterUrl: "url"))
        items.append(DataItem(id: 2, title: "Tytuł filmu nr 2", score: 7.9, posterUrl: "url"))
        items.append(DataItem(id: 3, title: "Tytuł filmu nr 3", score: 6.3, posterUrl: "url"))
        items.append(DataItem(id: 4, title: "Tytuł filmu nr 4", score: 8.1, posterUrl: "url"))
    }
    
    func getTitle(row: Int) -> String {
        return items[row].title
    }
    
    func getScore(row: Int) -> Double {
        return items[row].score
    }
    
    func getItemsCount() -> Int {
        return items.count
    }
}
