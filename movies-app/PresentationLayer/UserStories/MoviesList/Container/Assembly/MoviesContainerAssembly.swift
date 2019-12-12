//
//  MoviesContainerAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import EasyDi

class MoviesContainerAssembly: Assembly {
    
    lazy var usecasesAssembly = MoviesListNetworkingAssembly.instance()
    
    var genresDataSource: GenresDataSourceInput & GenresDataSourceOutput {
        return define(init: GenresDataSourceImp())
    }
    
    var genresDisplayManager: GenresDisplayManagerImp {
        return define(init:
            GenresDisplayManagerImp(genresDataSource: self.genresDataSource)
        )
    }
    
    var router: MoviesContainerRouter {
        return define(init: MoviesContainerRouterImp())
    }
    
    var genresPresenter: GenresPresenter {
        return define(init:
            GenresPresenterImp(
                genresUseCase: self.usecasesAssembly.genresUseCase,
                dataSource: self.genresDataSource
            )
        )
    }
    
    func inject(into controller: MainContainerController) {
        defineInjection(into: controller) {
            $0.genresDisplayManager = self.genresDisplayManager
            $0.genresPresenter = self.genresPresenter
            $0.genresDataSource = self.genresDataSource
            $0.router = self.router
            return $0
        }
    }
}
