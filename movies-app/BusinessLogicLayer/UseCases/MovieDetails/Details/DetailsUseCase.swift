//
//  DetailsUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol DetailsUseCase: class {
    func getMovieDetails(route: String) -> Promise<[MovieDetails]>
}
