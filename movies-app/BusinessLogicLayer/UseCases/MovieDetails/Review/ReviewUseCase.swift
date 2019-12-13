//
//  ReviewUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol ReviewsUseCase: class {
    func getReviews(route: String) -> Promise<[Review]>
}
