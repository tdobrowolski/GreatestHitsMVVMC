//
//  AppCoordinator.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    func start() {
        
        let coordinator = TopMoviesCoordinator(navigationController: navigationController!)
        coordinator.start()
        childCoordinators.append(coordinator)
    }
}
