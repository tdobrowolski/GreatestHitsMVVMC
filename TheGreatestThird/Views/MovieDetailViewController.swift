//
//  MovieDetailViewController.swift
//  TheGreatestThird
//
//  Created by Tobiasz Dobrowolski on 11/03/2019.
//  Copyright © 2019 Tobiasz Dobrowolski. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleTextView: UITextViewFixed!
    @IBOutlet weak var userScoreLabel: UILabel!
    @IBOutlet weak var overviewTextView: UITextViewFixed!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
