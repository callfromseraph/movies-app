//
//  MovieInfoAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 2/10/20.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import EasyDi

final class MovieInfoAssembly: Assembly {
    
    var router: MovieInfoRouterImp {
        return define(init: MovieInfoRouterImp())
    }

    var presenter: MovieInfoPresenter {
        return define(init:
            MovieInfoPresenterImp()
        )
    }

    func inject(into controller: MovieInfoViewController) {
        defineInjection(into: controller) {
            $0.presenter = self.presenter
            $0.router = self.router
            return $0
        }
    }
}
