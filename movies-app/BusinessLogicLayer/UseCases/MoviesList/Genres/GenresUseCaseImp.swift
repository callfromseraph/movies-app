//
//  GenresUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

final class GenresUseCaseImp: GenresUseCase {
    
    private var requestGateway: RequestGateway
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getGenres(route: String) -> Promise<[Genre]> {
        return Promise<[Genre]> { seal in
            requestGateway.getResults(route: route, parameters: nil).done { (genres: Genres) in
                seal.fulfill(genres.genres)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
