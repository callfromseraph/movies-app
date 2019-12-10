//
//  NetworkingAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import EasyDi

final class NetworkingAssembly: Assembly {
    var netwokring: Networking {
        return define(scope: .lazySingleton, init:
            NetworkingImp(
                baseURL: "https://api.themoviedb.org/3"
            )
        )
    }
}
