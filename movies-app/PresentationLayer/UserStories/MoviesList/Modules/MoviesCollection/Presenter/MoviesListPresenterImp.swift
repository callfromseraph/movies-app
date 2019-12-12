//
//  MoviesListPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class MoviesListPresenterImp: MoviesListPresenter, MoviesListPresenterInput {
    
    var dataSource: MoviesListDataSourceInput
    
    private var moviesListUseCase: MoviesListUseCase
    private var genre: Genre!
    
    init(
        moviesListUseCase: MoviesListUseCase,
        dataSource: MoviesListDataSourceInput
    ) {
        self.moviesListUseCase = moviesListUseCase
        self.dataSource = dataSource
    }
    
    func set(genre: Genre, type: Int) {
        self.genre = genre
    }
    
    func loadMovies(completion: @escaping Response) {
        let route: String = "/discover/movie"
        let parameters: [String: Any] = [:]
        
            moviesListUseCase.getPopularMovies(
                route: route,
                parameters: parameters,
                genreId: 1,
                type: 1
            ).done { movies in
                self.dataSource.present(movies: movies)
            }
            .catch { error in
                completion(error)
            }
    }
}
