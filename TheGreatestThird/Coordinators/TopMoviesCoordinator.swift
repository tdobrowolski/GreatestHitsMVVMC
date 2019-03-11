//
//  TopMoviesCoordinator.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

final class TopMoviesCoordinator: Coordinator {
    
    func start() {
        
        let viewController = assembler.resolver.resolve(TopMoviesViewController.self)
        
        navigationController?.pushViewController(viewController!, animated: true)
    }
}
