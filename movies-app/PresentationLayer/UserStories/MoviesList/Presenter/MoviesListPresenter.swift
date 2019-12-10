//
//  MoviesListPresenter.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

protocol MoviesListPresenter: ModuleInput {
    func loadMovies(completion: @escaping Response) -> Promise<MoviesList>
}
