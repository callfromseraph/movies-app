//
//  MoviesList.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

struct MoviesList: Codable {
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
