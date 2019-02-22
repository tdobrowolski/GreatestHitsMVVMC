//
//  TopMoviesViewModel.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import Foundation

protocol TopMoviesViewModelViewDelegate: class {
    
    func itemsDidChange(viewModel: TopMoviesViewModel)
}

protocol TopMoviesViewModelCoordinatorDelegate: class {
    
    func topMoviesViewModelDidSelectData(_ viewModel: TopMoviesViewModel, data: DataItem)
}

protocol TopMoviesViewModelType {
    
    var model: MoviesModel? { get set }
    var viewDelegate: TopMoviesViewModelViewDelegate? { get set }
    var coordinatorDelegate: TopMoviesViewModelCoordinatorDelegate? { get set }
    
    var numberOfItems: Int { get }
    func itemAtIndex(_ index: Int) -> DataItem?
    func useItemAtIndex(_ index: Int)
}

// Class

final class TopMoviesViewModel: TopMoviesViewModelType {
    
    // wskazują na nila 😔
    weak var viewDelegate: TopMoviesViewModelViewDelegate?
    weak var coordinatorDelegate: TopMoviesViewModelCoordinatorDelegate?
    
    private var items: [DataItem]? {
        didSet {
            print("itemki sie zmieniły")
            viewDelegate?.itemsDidChange(viewModel: self)
        }
    }
    
    var model: MoviesModel? {
        didSet {
            items = nil;
            model?.items({ (items) in
                self.items = items
            })
        }
    }
    
    var numberOfItems: Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    
    func itemAtIndex(_ index: Int) -> DataItem? {
        if let items = items, items.count > index {
            return items[index]
        }
        return nil
    }
    
    func useItemAtIndex(_ index: Int) {

        if let items = items, let coordinatorDelegate = coordinatorDelegate, index < items.count {
            coordinatorDelegate.topMoviesViewModelDidSelectData(self, data: items[index])
            print("useItemAtIndex")
        }
    }
    
}
