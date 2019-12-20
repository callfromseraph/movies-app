//
//  MoviesListRouterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class MoviesListRouterImp: MoviesListRouter {
    
    var viewController: BaseHandlerController?
    
    func openFilmDetails(for id: Int, with type: Int) {
        viewController?.openModule(with: L10n.Module.movieDetails) { moduleInput in
            guard let movieDetailsInput = moduleInput as? MovieDetailsPresenterInput else {
                return assertionFailure("Failed to cast moduleInput to MovieDetailsPresenterInput")
            }
            movieDetailsInput.set(id: id, type: type)
        }
    }
}
