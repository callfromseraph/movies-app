//
//  MovieDetailsPresenter.swift
//  movies-app
//
//  Created by David Petrosyan on 12/16/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol MovieDetailsPresenterInput: ModuleInput {
    var id: Int? { get }
    var type: Int! { get }
    
    func set(id: Int, type: Int)
}
