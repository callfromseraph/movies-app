//
//  MoviesListUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

protocol MoviesListUseCase: class {
    func getPopularMovies(route: String, parameters: [String: Any]? , genreId: Int, type: Int) -> Promise<MoviesList>
}
