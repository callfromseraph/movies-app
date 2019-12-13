//
//  Cast.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

struct Cast: Codable {
    let id: Int
    let name: String
    let profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
    }
}

struct Credits: Codable {
    let cast: [Cast]
}
