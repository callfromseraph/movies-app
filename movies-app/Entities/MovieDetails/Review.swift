//
//  Review.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

struct Review: Codable {
    let author: String
    let content: String
}

struct Reviews: Codable {
    let results: [Review]
}
