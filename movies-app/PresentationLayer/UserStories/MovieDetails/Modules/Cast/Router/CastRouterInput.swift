//
//  CastRouterInput.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol CastRouterInput: BaseRoutingProtocol {
    func navigateToAboutArtist(with id: Int, and type: Int)
}
