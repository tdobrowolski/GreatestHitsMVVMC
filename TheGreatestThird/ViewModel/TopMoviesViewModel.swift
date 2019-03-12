//
//  TopMoviesViewModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol TopMoviesViewModelType {
    
}

protocol TopMoviesViewModelCoordinatorDelegate: class {
    func startDetailCoordinator(model: DataItem)
}

final class TopMoviesViewModel: TopMoviesViewModelType {
    
    var items: [DataItem] = []
    weak var coordinatorDelegate: TopMoviesViewModelCoordinatorDelegate?
    let networkKeys = NetworkKeys()
    var nextInt = 1
    var totalPages = 0
 
    init() {
        fetchMovies()
    }
    
    // Networking

    func fetchMovies() {
        
        let url = URL(string: networkKeys.baseUrl + "movie/top_rated" + networkKeys.apiKey + "&page=" + String(nextInt))!
        print("url: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error == nil {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MoviesResult.self, from: data!)
                    
                    self.items += decodedData.results
                    self.totalPages = decodedData.totalPages
                    self.nextInt += 1
                } catch let decoderError {
                    print("Decoder error: \(decoderError)")
                }
            } else {
                print("Request error: \(String(describing: error))")
            }
            
        }
        
        task.resume()
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
    
    func useItemAtIndex(index: Int) {
        let item = items[index]
        print("useItemAtIndex: \(item) - \(index)")
        self.coordinatorDelegate?.startDetailCoordinator(model: item)
    }
}
