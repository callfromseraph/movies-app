//
//  CastPresenter.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

protocol CastPresenter: ModuleInput {
    
    func setCedits(completion: @escaping Response)
}
