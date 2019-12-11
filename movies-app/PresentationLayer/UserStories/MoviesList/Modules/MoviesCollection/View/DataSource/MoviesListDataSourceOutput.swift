//
//  MoviesListDataSourceOutput.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol MoviesListDataSourceOutput: class {
    var movies: [CategorizedMovie] { get }
    var delegate: MoviesListDataSourceDelegate? { get set }
}
