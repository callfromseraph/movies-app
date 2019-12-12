//
//  GenresDataSourceOutput.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol GenresDataSourceOutput: class {
    var genres: [Genre] { get }
    var delegate: GenresDelegate? { get set }
    var type: Int! { get set }
}
