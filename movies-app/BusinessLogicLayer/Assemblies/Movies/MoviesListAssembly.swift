//
//  MoviesListAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import EasyDi

final class MoviesListAssembly: Assembly {
    
    lazy var networking: NetworkingAssembly = self.context.assembly()
    
    // MARK: - Gateways
    
    var moviesGateway: RequestGateway {
        return define(scope: .lazySingleton, init:
            RequestGatewayImp(
                networking: self.networking.netwokring,
                parameters: [
                    "api_key": L10n.apiKey,
                    "langiage": "en-US"
                ],
                headers: [
                    "Content-Type": "application/json",
                    "Accept": "application/json"
                ],
                method: RequestMethod.GET
            )
        )
    }
    
    // MARK: - UseCases
    
    var moviesListUsecase: MoviesListUseCase {
        return define(scope: .lazySingleton, init:
            MoviesListUseCaseImp(
                requestGateway: self.moviesGateway
            )
        )
    }
}
