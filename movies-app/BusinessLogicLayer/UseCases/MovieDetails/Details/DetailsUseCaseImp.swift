//
//  DetailsUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

final class DetailsUseCaseImp: DetailsUseCase {
    
    private var requestGateway: RequestGateway
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getMovieDetails(route: String) -> Promise<[MovieDetails]> {
        return requestGateway.getResults(route: route, parameters: nil)
    }
}
