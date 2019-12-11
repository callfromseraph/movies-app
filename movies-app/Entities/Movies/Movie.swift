//
//  Movie.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

struct Movie: Codable {
    
    let id: Int
    let name: String?
    let title: String?
    let overview: String?
    let adult: Bool?
    let averageVote: Float
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case title
        case overview
        case adult
        case averageVote = "vote_average"
        case posterPath = "poster_path"
    }
}
