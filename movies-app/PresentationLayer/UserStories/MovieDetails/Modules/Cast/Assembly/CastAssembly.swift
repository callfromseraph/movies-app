//
//  CastAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/23/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import EasyDi

final class CastAssembly: Assembly {
    
    lazy var presenterAssembly = MovieDetailsAssembly.instance()
    lazy var useCasesAssembly = MovieDetailsNetworkingAssembly.instance()
    
    var castDataSource: CastDataSourceInput & CastDataSourceInput {
        return define(init: CastDataSourceImp())
    }
    
    var castRouter: CastRouterImp {
        return define(init: CastRouterImp())
    }
    
    var castPresenter: CastPresenter {
        return define(init:
            CastPresenterImp(
                castUseCase: self.useCasesAssembly.castUseCase,
                castDataSource: self.castDataSource,
                movieDetailsPresenter: self.presenterAssembly.movieDetailsPresenter,
                router: self.castRouter
            )
        )
    }
}
