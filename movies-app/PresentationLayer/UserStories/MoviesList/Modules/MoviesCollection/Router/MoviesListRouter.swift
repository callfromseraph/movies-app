//
//  MoviesListRouter.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

protocol MoviesListRouter {
    func openFilmDetails(for id: Int, with type: Int)
}
