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
    
    lazy var usecasesAssembly = MoviesListNetworkingAssembly.instance()
    
    var moviesListRouter: MoviesListRouterImp {
        return define(init: MoviesListRouterImp())
    }
    
    var moviesListDataSource: MoviesListDataSource {
        return define(init: MoviesListDataSource())
    }
    
    var moviesListPresenter: MoviesListPresenter {
        return define(init:
            MoviesListPresenterImp(
                moviesListUseCase: self.usecasesAssembly.moviesListUsecase,
                dataSource: self.moviesListDataSource
            )
        )
    }
    
    var moviesDisplayManager: MoviesListDisplayManager {
        return define(init:
            MoviesListDisplayManager(
                moviesListDataSource: self.moviesListDataSource,
                moviesListPresenter: self.moviesListPresenter
            )
        )
    }
    
    func inject(into controller: MoviesListViewController) {
        defineInjection(into: controller) {
            $0.moviesDisplayManager = self.moviesDisplayManager
            $0.presenter = self.moviesListPresenter
            $0.router = self.moviesListRouter
            $0.moduleInput = self.moviesListPresenter
            return $0
        }
    }
}
