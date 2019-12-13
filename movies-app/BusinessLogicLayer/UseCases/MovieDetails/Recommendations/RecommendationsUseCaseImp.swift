//
//  RecommendationsUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

final class RecommendationsUseCaseImp: RecommendationsUseCase {
    
    private var requestGateway: RequestGateway
    private var page = 0
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getRecommended(route: String) -> Promise<[Movie]> {
        page += 1
        return Promise<[Movie]> { seal in
            requestGateway.getResults(
                route: route,
                parameters: ["page": page]
            ).done { (movies: MoviesList) in
                seal.fulfill(movies.results)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
