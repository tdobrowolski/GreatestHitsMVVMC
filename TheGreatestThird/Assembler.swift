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
        container.register(TopMoviesViewModel.self) { _ in TopMoviesViewModel() }
        container.register(TopMoviesViewController.self) { r in
            let vc = TopMoviesViewController()
            vc.viewModel = r.resolve(TopMoviesViewModel.self)
            return vc
        }
    }
    
    
}
