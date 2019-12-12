//
//  MovieCollectionViewCell.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView! {
        didSet {
            posterImageView.layer.masksToBounds = true
            posterImageView.layer.cornerRadius = 4
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.textAlignment = .left
            titleLabel.textColor = UIColor.TitleTextColor
            titleLabel.font = UIFont.TitleContent
        }
    }
    
    @IBOutlet weak var averageVoteLabel: UILabel! {
        didSet {
            averageVoteLabel.textColor = UIColor.ActiveTextColor
            averageVoteLabel.font = UIFont.ActiveTextOnContent
        }
    }
    
    @IBOutlet weak var ageLabel: UILabel! {
        didSet {
            ageLabel.textColor = UIColor.TitleTextColor
            ageLabel.font = UIFont.TextAgeOnMoviesCollection
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 4
        self.backgroundColor = UIColor.PosterBackgroundColor
    }
    
    func setContent(for movie: CategorizedMovie) {
        self.titleLabel.text = movie.title
        self.averageVoteLabel.text = String(movie.averageVote)
        self.ageLabel.text = (movie.adult ?? false) ? L10n.adult : L10n.notAdult
        self.posterImageView.downloadedFrom(link: movie.posterPath, contentMode: .scaleAspectFill)
    }
}
