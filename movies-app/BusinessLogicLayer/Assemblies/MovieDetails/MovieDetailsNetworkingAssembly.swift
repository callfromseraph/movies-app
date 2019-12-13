//
//  MovieDetailsNetworkingAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import EasyDi

final class MovieDetailsNetworkingAssembly: Assembly {
    
    lazy var networking: NetworkingAssembly = self.context.assembly()
    
    // MARK: - Gateways
    
    var movieDetailsGateway: RequestGateway {
        return define(scope: .lazySingleton, init:
            RequestGatewayImp(
                networking: self.networking.networking,
                parameters: [
                    "api_key": L10n.apiKey,
                    "language": "en-US"
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
    
    var castUseCase: CastUseCase {
        return define(scope: .lazySingleton, init:
            CastUseCaseImp(
                requestGateway: self.movieDetailsGateway
            )
        )
    }
    
    var movieDetailsUseCase: DetailsUseCase {
        return define(scope: .lazySingleton, init:
            DetailsUseCaseImp(
                requestGateway: self.movieDetailsGateway
            )
        )
    }
    
    var galleryUseCase: GalleryUseCase {
        return define(scope: .lazySingleton, init:
            GalleryUseCaseImp(
                requestGateway: self.movieDetailsGateway
            )
        )
    }
    
    var recommendationsUseCase: RecommendationsUseCase {
        return define(scope: .lazySingleton, init:
            RecommendationsUseCaseImp(
                requestGateway: self.movieDetailsGateway
            )
        )
    }
    
    var reviewsUseCase: ReviewsUseCase {
        return define(scope: .lazySingleton, init:
            ReviewsUseCaseImp(
                requestGateway: self.movieDetailsGateway
            )
        )
    }
}
