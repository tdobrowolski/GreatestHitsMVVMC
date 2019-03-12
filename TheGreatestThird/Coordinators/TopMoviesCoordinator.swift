//
//  TopMoviesCoordinator.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

final class TopMoviesCoordinator: Coordinator {
    
    var viewController: TopMoviesViewController?
    
    func start() {
        
        //viewController = assembler.resolver.resolve(TopMoviesViewController.self)
        viewController = TopMoviesViewController()
        let vm = TopMoviesViewModel()
        vm.coordinatorDelegate = self
        viewController?.viewModel = vm
        
        navigationController?.pushViewController(viewController!, animated: true)
    }
    
    deinit {
        print("TopMoviesCoordinator deallocated")
    }
}

extension TopMoviesCoordinator: TopMoviesViewModelCoordinatorDelegate {
    
    func startDetailCoordinator(model: DataItem) {
        let coordinator = MovieDetailCoordinator(navigationController: navigationController!)
        coordinator.model = model
        coordinator.start()
    }
}
