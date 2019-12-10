//
//  MoviesListAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import EasyDi

class MoviesListAssembly: Assembly {
    
    lazy var usecasesAssembly = PopularMoviesListAssembly.instance()
    
    var moviesListRouter: MoviesListRouterImp {
        return define(init: MoviesListRouterImp())
    }
    
    var moviesListPresenter: MoviesListPresenter {
        return define(init:
            MoviesListPresenterImp(
                moviesListUseCase: self.usecasesAssembly.moviesListUsecase
            )
        )
    }
    
    func inject(into controller: MoviesListViewController) {
        defineInjection(into: controller) {
            $0.presenter = self.moviesListPresenter
            $0.router = self.moviesListRouter
            $0.moduleInput = self.moviesListPresenter
            return $0
        }
    }
}
