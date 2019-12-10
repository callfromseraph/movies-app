//
//  MoviesListPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

final class MoviesListPresenterImp: MoviesListPresenter {
    
    private var moviesListUseCase: MoviesListUseCase
    
    init(moviesListUseCase: MoviesListUseCase) {
        self.moviesListUseCase = moviesListUseCase
    }
    
    func loadMovies(completion: @escaping Response) -> Promise<MoviesList> {
        let route: String = "/discover/movie"
        let parameters: [String: Any] = [:]
        
        return Promise { seal in
            moviesListUseCase.getPopularMovies(
                route: route,
                parameters: parameters,
                genreId: 1,
                type: 1
            ).done { movies in
                seal.fulfill(movies)
            }
            .catch { error in
                seal.reject(error)
//                completion(error)
            }
        }
    }
}
