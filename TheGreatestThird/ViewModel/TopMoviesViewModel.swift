//
//  TopMoviesViewModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import Kingfisher

protocol TopMoviesViewModelType {
    
}

protocol TopMoviesViewModelCoordinatorDelegate: class {
    func startDetailCoordinator(model: DataItem)
}

protocol TopMoviesViewModelViewControllerDelegate: class {
    func refreshDisplay()
}

final class TopMoviesViewModel: TopMoviesViewModelType {
    
    var items: [DataItem] = []
    weak var coordinatorDelegate: TopMoviesViewModelCoordinatorDelegate?
    weak var viewControllerDelegate: TopMoviesViewModelViewControllerDelegate?
    let networkKeys = NetworkKeys()
    let networking = Networking()
    var nextInt = 1
    var totalPages = 1
    var isLoading: Bool = false
    
    // Networking

    func fetchMovies(closure: @escaping () -> Void) {
        
        if isLoading {
            return
        }
        
        let url = URL(string: networkKeys.baseUrl + "movie/top_rated" + networkKeys.apiKey + "&page=" + String(nextInt))!
        print("url: \(url)")
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            self.isLoading = true
            
            if error == nil {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MoviesResult.self, from: data!)
                    
                    self.parseDecodedData(decodedData: decodedData)
                    closure()
                } catch let decoderError {
                    print("Decoder error: \(decoderError)")
                }
            } else {
                print("Request error: \(String(describing: error))")
            }
            
            self.isLoading = false
        }
        
        if !isLoading, nextInt <= totalPages {
            task.resume()
        }
    }
    
    func fetchMovies() {
        
        if isLoading { return }
        self.isLoading = true
        
        guard let url = URL(string: networkKeys.baseUrl + "movie/top_rated" + networkKeys.apiKey + "&page=" + String(nextInt)) else {
            print("URL error: Can't create URL")
            return
        }
        
        networking.makeGetRequest(url: url) { data in
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(MoviesResult.self, from: data)
                    self.parseDecodedData(decodedData: decodedData)
                } catch let decodedError {
                    print("An error occurred during encoding: \(decodedError.localizedDescription)")
                }
            } else {
                print("No data received")
            }
            
            self.isLoading = false
        }
    }
    
    func getImage(row: Int, imageView: UIImageView) -> UIImageView {
        
        let imageUrl = networkKeys.baseImageUrl + posterWidths.medium.rawValue + items[row].posterUrl
        
        return imageView.setImage(from: imageUrl)
    }
    
    func parseDecodedData(decodedData: MoviesResult) {
        
        self.items += decodedData.results
        self.totalPages = decodedData.totalPages
        self.nextInt += 1
        self.viewControllerDelegate?.refreshDisplay()
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
        self.coordinatorDelegate?.startDetailCoordinator(model: item)
    }
}

extension UIImageView {
    
    func setImage(from url: String) -> UIImageView {
        
        let imageUrl = URL(string: url)
        let placeholder = UIImage(named: "placeholder")
        
        if let imageUrl = imageUrl {
            self.kf.setImage(with: imageUrl, placeholder: placeholder, options: [.transition(.fade(0.2))])
        } else {
            self.image = placeholder
        }
        
        return self
    }
    
}
