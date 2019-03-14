//
//  Networking.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 13/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

struct Networking {
    
    func makeGetRequest(url: URL, completion: @escaping (_ data: Data?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("An error occured: \(error.localizedDescription)")
                completion(nil)
            }
            
            if let response = response as? HTTPURLResponse {
                print("Response status code: \(response.statusCode)")
            }
            
            if let data = data {
                completion(data)
            }
        }
        
        task.resume()
    }
}
