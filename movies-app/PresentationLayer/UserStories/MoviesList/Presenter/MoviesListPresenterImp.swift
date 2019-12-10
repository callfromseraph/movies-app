//
//  MoviesListPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class MoviesListPresenterImp: MoviesListPresenter {
    
    private var moviesListUseCase: MoviesListUseCase
    
    init(moviesListUseCase: MoviesListUseCase) {
        self.moviesListUseCase = moviesListUseCase
    }
    
    func loadMovies(completion: @escaping Response) {
        let route: String = "discover/movie"
        let parameters: [String: Any] = [:]
        
        moviesListUseCase.getPopularMovies(
            route: route,
            parameters: parameters,
            genreId: 0,
            type: 0
        ).done { movies in
            print(movies)
        }
        .catch { error in
            completion(error)
        }
    }
}
