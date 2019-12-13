//
//  CastUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol CastUseCase: class {
    func getCast(route: String) -> Promise<[Cast]>
}
