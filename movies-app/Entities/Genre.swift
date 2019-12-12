//
//  Genre.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

struct Genre: Codable, Hashable {
    let id: Int
    let name: String
}

struct Genres: Codable {
    let genres: [Genre]
}
