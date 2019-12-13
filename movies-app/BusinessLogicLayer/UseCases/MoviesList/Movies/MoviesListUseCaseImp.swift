//
//  MoviesListUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

final class MoviesListUseCaseImp: MoviesListUseCase {
    private var requestGateway: RequestGateway
    private var page = 0
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getPopularMovies(route: String, parameters: [String: Any]?, genreId: Int, type: Int) -> Promise<[CategorizedMovie]> {
        page += 1
        var newParameters = parameters
        if newParameters != nil {
            newParameters!["page"] = page
        }
        
        return Promise<[CategorizedMovie]> { seal in
            requestGateway.getResults(route: route, parameters: newParameters).done { (movies: MoviesList) in
                let categorizedMovies = self.categorizedMovies(movies: movies.results, type: type, genreId: genreId)
                seal.fulfill(categorizedMovies)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
    
    private func categorizedMovies(movies: [Movie], type: Int, genreId: Int) -> [CategorizedMovie] {
        var categorizedMovies: [CategorizedMovie] = []
        movies.forEach {
            categorizedMovies.append(CategorizedMovie(
                id: genreId,
                name: $0.name,
                title: $0.title,
                overview: $0.overview,
                adult: $0.adult,
                averageVote: $0.averageVote,
                posterPath: $0.posterPath,
                genreId: genreId,
                type: type)
            )
        }
        return categorizedMovies
    }
}
