//
//  Networking.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 13/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol NetworkType {
    func makeGetRequest(url: URL) -> Data
}

struct Network: NetworkType {
    
    func makeGetRequest(url: URL) -> Data {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("An error occured: \(error)")
                return
            }
            
            //if let data = data
            
        }
        
        task.resume()
        return Data() //xd
    }
}
