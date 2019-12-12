//
//  GenreNameCollectionViewCell.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

class GenreNameCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var genreNameLabel: UILabel!
    
    func set(title: String) {
        let attrStr = NSAttributedString(string: title.uppercased(), attributes: [
            .foregroundColor: UIColor.TabNameColor,
            .font: UIFont.TabName
        ])

        genreNameLabel.attributedText = attrStr
        genreNameLabel.textColor = (isSelected) ? UIColor.ActiveTextColor : UIColor.TabNameColor

    }
    
    override var isSelected: Bool {
        didSet {
            genreNameLabel.textColor = isSelected ? UIColor.ActiveTextColor : UIColor.TabNameColor
        }
    }
}
