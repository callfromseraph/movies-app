//
//  MovieInfoReusableView.swift
//  movies-app
//
//  Created by David Petrosyan on 2/11/20.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import UIKit

class MovieInfoReusableView: UICollectionReusableView {

    @IBOutlet weak var posterImageView: UIImageView! {
        didSet {
            posterImageView.layer.cornerRadius = 4
//            posterImageView.layer.
        }
    }
    
    @IBOutlet weak var infoTitlesStackView: UIStackView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var starsRating: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func set(details: MovieDetails) {
        titleLabel.text = details.title ?? details.name ?? "no info"
        countryLabel.text = details.productionCountries?[0].name ?? details.originCountry?[0] ?? "no info"
        descriptionLabel.text = details.overview
        ratingLabel.text = String(details.voteAverage)
        ageLabel.text = details.adult != nil ? "18+" : "0"
    }
}
