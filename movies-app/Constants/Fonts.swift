//
//  Fonts.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

extension UIFont {

    private static func getFont(named name: String, of size: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: size) else {
            #if DEBUG
            fatalError("Could not load font \(name).")
            #else
            return .systemFont(ofSize: size)
            #endif
        }
        return font
    }

    static let TabName = getFont(named: "SegoeUI-Regular", of: 14)

    static let AppName = getFont(named: "SegoeUI-Semibold", of: 17)

    static let TitleContent = getFont(named: "SegoeUI-Semibold", of: 13)

    static let ActiveTextOnContent = getFont(named: "SegoeUI-Semibold", of: 12)

    static let TextAgeOnMoviesCollection = getFont(named: "SegoeUI-Semibold", of: 12)

    static let AboutFilmTab = getFont(named: "SegoeUI-Regular", of: 13)

    static let AboutFilmTitle = getFont(named: "SegoeUI-Semibold", of: 24)

    static let AboutFilmInfoTitleAndDesc = getFont(named: "SegoeUI-Regular", of: 14)

    static let AboutFilmTitles = getFont(named: "SegoeUI-Semibold", of: 18)

    static let CastName = getFont(named: "SegoeUI-Regular", of: 16)

    static let ReviewMark = getFont(named: "SegoeUI-Semibold", of: 14)

    static let ArtistName = getFont(named: "SegoeUI-Regular", of: 20)

    static let MenuItem = getFont(named: "SegoeUI-Regular", of: 18)

    static let SearchPlaceholder = getFont(named: "SegoeUI-Regular", of: 17)

    static let SearchCardOverview = getFont(named: "SegoeUI-Regular", of: 12)

}
