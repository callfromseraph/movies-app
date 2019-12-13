//
//  GalleryImage.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

struct GalleryImage: Codable {
    let filePath: String
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}

struct Gallery: Codable {
    let backdrops: [GalleryImage]
}
