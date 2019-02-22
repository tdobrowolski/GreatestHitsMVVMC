//
//  TopMoviesViewController.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 19/02/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import UIKit

class TopMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel: TopMoviesViewModel?

    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MovieTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MovieCell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.title = "Top rated movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        refreshDisplay()
    }
    
    func refreshDisplay() {
        tableView.reloadData()
    }
    
    // MARK: - Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let viewModel = viewModel {
            return viewModel.numberOfItems
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieTableViewCell
        let currentItem = viewModel?.itemAtIndex(indexPath.row)
        cell.titleTextView.text = currentItem?.title
        cell.userScoreLabel.text = "User score: \(currentItem?.score ?? 0) / 10"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.useItemAtIndex(indexPath.row)
    }
}

extension TopMoviesViewController: TopMoviesViewModelViewDelegate {
    
    func itemsDidChange(viewModel: TopMoviesViewModel) {
        refreshDisplay()
    }
}
