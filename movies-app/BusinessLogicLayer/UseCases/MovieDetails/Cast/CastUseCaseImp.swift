//
//  CastUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

final class CastUseCaseImp: CastUseCase {
    
    private var requestGateway: RequestGateway
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getCast(route: String) -> Promise<[Cast]> {
        return Promise<[Cast]> { seal in
            requestGateway.getResults(route: route, parameters: nil).done { (credits: Credits) in
                seal.fulfill(credits.cast)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
