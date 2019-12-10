//
//  MoviesListUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

class MoviesListUseCaseImp: MoviesListUseCase {
    private var requestGateway: RequestGateway
    private var page = 0
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getPopularMovies(route: String, parameters: [String: Any]?, genreId: Int, type: Int) -> Promise<MoviesList> {
        page += 1
        var newParameters = parameters
        if newParameters != nil {
            newParameters!["page"] = page
        }
        
        return Promise<MoviesList> { seal in
            requestGateway.getResults(route: route, parameters: newParameters).done { (movies: MoviesList) in
                seal.fulfill(movies)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
