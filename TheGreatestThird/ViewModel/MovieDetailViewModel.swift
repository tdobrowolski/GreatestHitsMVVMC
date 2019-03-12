//
//  MovieDetailViewModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 12/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelType {
    
}

protocol MovieDetailViewModelViewDelegate: class {
    func setupUI()
}

final class MovieDetailViewModel: MovieDetailViewModelType {
    
    var model: DataItem
    let networkKeys = NetworkKeys()
    private weak var delegate: MovieDetailViewModelViewDelegate?
    
    init(model: DataItem, delegate: MovieDetailViewModelViewDelegate) {
        self.model = model
        self.delegate = delegate
    }
    
    func fetchMovieDetail() {
        
        guard let url = URL(string: networkKeys.baseUrl + "movie/" + String(model.id) + networkKeys.apiKey) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            // check data
            if error == nil {
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(DataItem.self, from: data)
                        self.model = decodedData
                        DispatchQueue.main.async { [weak self] in // poczytaj dispatchqueue grandcentraldispatch
                            self?.delegate?.setupUI()
                        }
                    }
                } catch let decoderError {
                    print("Decoder error: \(decoderError)")
                }
            } else {
                print("Request error: \(String(describing: error))")
            }
            
        }
        
        task.resume()
    }
    
    func getTitle() -> String {
        return model.title
    }
    
    func getScore() -> String {
        return "User score \(model.score) / 10"
    }
    
    func getOverview() -> String {
        if let overview = model.overview {
            return overview
        }
        return "None"
    }
    
    func getGenres() -> String {
        if let genres = model.genres {
            var formattedGenres: [String] = []
            for genreObject in genres {
                formattedGenres.append(genreObject.name)
            }
            return formattedGenres.joined(separator: ", ")
        }
        return "None"
    }
    
    func getReleaseDate() -> String {
        if let date = model.releaseDate {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            let formattedDate = formatter.date(from: date)
            formatter.dateFormat = "dd MMM yyyy"
            
            return formatter.string(from: formattedDate!)
        }
        return "None"
    }
    
    func getRevenue() -> String {
        if let revenue = model.revenue {
            if revenue == 0 { return "N/A" }
            let num: NSNumber = NSNumber.init(value: Int64(revenue))
            let formatter = NumberFormatter()
            formatter.groupingSeparator = ","
            formatter.numberStyle = .decimal
            
            return "$" + formatter.string(from: num)! + ".00"
        }
        return "None"
    }
    
}
