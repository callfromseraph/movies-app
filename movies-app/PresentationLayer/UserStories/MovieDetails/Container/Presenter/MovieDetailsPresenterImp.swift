//
//  MovieDetailsPresenterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/16/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class MovieDetailsPresenterImp: MovieDetailsPresenterInput {
    
    var id: Int?
    var type: Int!
    
    func set(id: Int, type: Int) {
        self.id = id
        self.type = type
    }
}
