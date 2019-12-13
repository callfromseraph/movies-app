//
//  Details.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

struct MovieDetails: Codable {
    let id: Int
    let title: String?
    let releaseDate: String?
    let voteAverage: Float
    let runtime: Int?
    let overview: String?
    let productionCountries: [ProductionCountry]?
    let posterPath: String?
    let video: Bool?
    let adult: Bool?

    let name: String?
    let originCountry: [String]?
    let firstAirDate: String?
    let numberOfSeasons: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case runtime
        case overview
        case productionCountries = "production_countries"
        case posterPath = "poster_path"
        case video
        case adult

        case name
        case originCountry = "origin_country"
        case firstAirDate = "first_air_date"
        case numberOfSeasons = "number_of_seasons"
    }
}
