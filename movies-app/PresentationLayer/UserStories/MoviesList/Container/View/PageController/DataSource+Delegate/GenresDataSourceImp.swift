//
//  GenresDataSourceImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class GenresDataSourceImp: GenresDataSourceInput, GenresDataSourceOutput {
    
    var genres: [Genre]
    weak var delegate: GenresDelegate?
    var type: Int!
    
    init() {
        genres = []
    }
    
    func addGenres(_ genres: [Genre]) {
        self.genres += genres
        delegate?.didAddGenres(self.genres)
    }
}
