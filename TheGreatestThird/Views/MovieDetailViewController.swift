//
//  MovieDetailViewController.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 11/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextViewFixed!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextViewFixed!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    
    var viewModel: MovieDetailViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.tintColor = UIColor(red:0.02, green:0.75, blue:0.43, alpha:1.0)
        
        self.genresLabel.numberOfLines = 0

        setupImageView()
        viewModel!.fetchMovieDetail()
    }
    
    func setupImageView() {
        
        shadowView.layer.cornerRadius = 8
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 8)
        shadowView.layer.shadowOpacity = 0.2
        shadowView.layer.shadowRadius = 10
        shadowView.backgroundColor = UIColor.white
        
        posterImageView.clipsToBounds = true
        posterImageView.layer.cornerRadius = 8
    }
}

extension MovieDetailViewController: MovieDetailViewModelViewDelegate {

    func setupUI() {
        DispatchQueue.main.async {
            if let viewModel = self.viewModel {
                self.posterImageView = viewModel.getImage(imageView: self.posterImageView)
                self.titleTextView.text = viewModel.getTitle()
                self.userScoreLabel.text = viewModel.getScore()
                self.overviewTextView.text = viewModel.getOverview()
                self.genresLabel.text = viewModel.getGenres()
                self.releaseDateLabel.text = viewModel.getReleaseDate()
                self.revenueLabel.text = viewModel.getRevenue()
            }
        }
    }
}
