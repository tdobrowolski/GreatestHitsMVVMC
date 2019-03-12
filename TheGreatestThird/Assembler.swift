//
//  Assembler.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 11/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import Swinject

struct Elements: Assembly {
    
    func assemble(container: Container) {
        container.register(TopMoviesCoordinator.self) { _, navigationController in
            TopMoviesCoordinator(navigationController: navigationController)
        }
        container.register(TopMoviesViewModel.self) { r in
            let vm = TopMoviesViewModel()
            vm.coordinatorDelegate = r.resolve(TopMoviesCoordinator.self)
            return vm
        }
        container.register(TopMoviesViewController.self) { r in
            let vc = TopMoviesViewController()
            vc.viewModel = r.resolve(TopMoviesViewModel.self)
            return vc
        }
        /*
        container.register(MovieDetailCoordinator.self) { _, navigationController in
            MovieDetailCoordinator(navigationController: navigationController)
        }
        container.register(MovieDetailViewModel.self) { r in
            let vm = MovieDetailViewModel()
            vm.coordinator = r.resolve(MovieDetailCoordinator.self)
            return vm
        }
        container.register(MovieDetailViewController.self) { r in
            let vc = TopMoviesViewController()
            vc.viewModel = r.resolve(TopMoviesViewModel.self)
            return vc
        }
        */
    }
    
    
}
