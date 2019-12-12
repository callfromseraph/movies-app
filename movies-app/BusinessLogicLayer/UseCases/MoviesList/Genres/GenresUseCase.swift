//
//  GenresUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol GenresUseCase: class {
    func getGenres(route: String) -> Promise<[Genre]>
}
