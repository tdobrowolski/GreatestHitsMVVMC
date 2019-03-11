//
//  Coordinator.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation
import UIKit
import Swinject

class Coordinator {
    
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    var assembler: Assembler
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.assembler = Assembler(parentAssembler: (UIApplication.shared.delegate as! AppDelegate).assembler)
    }
}
