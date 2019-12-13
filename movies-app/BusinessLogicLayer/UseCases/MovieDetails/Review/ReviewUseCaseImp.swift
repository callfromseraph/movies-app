//
//  ReviewUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

class ReviewsUseCaseImp: ReviewsUseCase {
    
    private var requestGateway: RequestGateway
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getReviews(route: String) -> Promise<[Review]> {
        return Promise<[Review]> { seal in
            requestGateway.getResults(route: route, parameters: nil).done { (reviews: Reviews) in
                seal.fulfill(reviews.results)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
