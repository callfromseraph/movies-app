//
//  CastDataSourceOutput.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol CastDataSourceOutput: class {
    var credits: [Cast] { get }
    var delegate: CastDataSourceDelegate? { get set }
}
