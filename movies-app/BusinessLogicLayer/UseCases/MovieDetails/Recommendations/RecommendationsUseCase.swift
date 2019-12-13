//
//  RecommendationsUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol RecommendationsUseCase: class {
    func getRecommended(route: String) -> Promise<[Movie]>
}
