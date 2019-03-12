//
//  MovieDetailCoordinator.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 12/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

final class MovieDetailCoordinator: Coordinator {
    
    var model: DataItem?
    
    func start() {
        
        //let viewController = assembler.resolver.resolve(MovieDetailViewController.self)!
        let viewController = MovieDetailViewController()
        viewController.viewModel = MovieDetailViewModel(model: model!, delegate: viewController as MovieDetailViewModelViewDelegate)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
