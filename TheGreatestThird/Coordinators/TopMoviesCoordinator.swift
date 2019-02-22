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
        
        let viewController = TopMoviesViewController()
        
        let viewModel = TopMoviesViewModel()
        viewModel.model = MoviesModel()
        viewModel.coordinatorDelegate = self
        viewController.viewModel = viewModel
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension TopMoviesCoordinator: TopMoviesViewModelCoordinatorDelegate {
    
    func topMoviesViewModelDidSelectData(_ viewModel: TopMoviesViewModel, data: DataItem) {
        print("Wybrano: \(data.title)")
        // Tutaj zaimplementuj przejście do nowego widoku
    }
}
