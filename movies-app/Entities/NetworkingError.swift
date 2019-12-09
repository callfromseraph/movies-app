//
//  NetworkingError.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case corruptedData
    case networkError
    case jsonCouldNotBeSerialized
}
