//
//  MovieDetailsAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/16/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import EasyDi

class MovieDetailsAssembly: Assembly {
    
    var movieDetailsPresenter: MovieDetailsPresenterInput {
        return define(scope: .lazySingleton, init: MovieDetailsPresenterImp())
    }
    
    func inject(into controller: MovieDetailsViewController) {
        defineInjection(into: controller) {
            $0.moduleInput = self.movieDetailsPresenter
            return $0
        }
    }
}
