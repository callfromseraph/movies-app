//
//  GenresDisplayManagerDelegate.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

protocol GenresDisplayManagerDelegate: class {
    func didSelectGenre(at indexPath: IndexPath)
}
