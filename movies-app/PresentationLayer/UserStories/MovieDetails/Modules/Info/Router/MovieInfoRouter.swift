//
//  MovieInfoRouter.swift
//  movies-app
//
//  Created by David Petrosyan on 2/10/20.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

final class MovieInfoRouterImp: MovieInfoRouterInput {
    
    weak var viewController: BaseHandlerController?
    
    func closeCurrentModule() {
        viewController?.closeModule()
    }
}
