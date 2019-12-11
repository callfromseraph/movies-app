//
//  MoviesListDataSource.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class MoviesListDataSource: MoviesListDataSourceInput, MoviesListDataSourceOutput {
    
    weak var delegate: MoviesListDataSourceDelegate?
    var movies: [CategorizedMovie]
    
    init() {
        movies = []
    }
    
    func present(movies: [CategorizedMovie]) {
        let firstIndex = self.movies.count
        self.movies += movies
        var indexPaths: [IndexPath] = []
        for movie in firstIndex..<self.movies.count {
            indexPaths.append(IndexPath(item: movie, section: 0))
        }
        delegate?.didAddMovies(with: indexPaths)
    }
}
