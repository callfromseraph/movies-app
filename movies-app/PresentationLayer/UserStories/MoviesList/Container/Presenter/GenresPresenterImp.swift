//
//  GenresPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class GenresPresenterImp: GenresPresenter {
    
    private var genresUseCase: GenresUseCase
    private var dataSource: GenresDataSourceInput
    
    init(genresUseCase: GenresUseCase, dataSource: GenresDataSourceInput) {
        self.genresUseCase = genresUseCase
        self.dataSource = dataSource
    }
    
    func setGenres(completion: @escaping Response) {
        genresUseCase.getGenres(route: "/genre/movie/list").done { genres in
            self.dataSource.addGenres(genres)
            completion(nil)
        }.catch { error in
            completion(error)
        }
    }
}
