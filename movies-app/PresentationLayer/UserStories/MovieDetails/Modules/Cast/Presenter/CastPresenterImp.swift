//
//  CastPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class CastPresenterImp: CastPresenter {
    
    private var castUseCase: CastUseCase
    private var castDataSource: CastDataSourceInput
    private var router: CastRouterInput
    private weak var movieDetailsPresenter: MovieDetailsPresenterInput?
    
    var id: Int {
        guard let movieId = movieDetailsPresenter?.id else {
            router.closeCurrentModule()
            assertionFailure("Movie id does not exist")
            return 0
        }
        return movieId
    }
    
    init(
        castUseCase: CastUseCase,
        castDataSource: CastDataSourceInput,
        movieDetailsPresenter: MovieDetailsPresenterInput,
        router: CastRouterInput
    ) {
        self.castUseCase = castUseCase
        self.castDataSource = castDataSource
        self.movieDetailsPresenter = movieDetailsPresenter
        self.router = router
    }
    
    func setCedits(completion: @escaping Response) {
        castUseCase.getCast(route: "movie/\(id)/credits").done { credits in
            self.castDataSource.addCredits(credits)
            completion(nil)
        }.catch { error in
            completion(error)
        }
    }
}
