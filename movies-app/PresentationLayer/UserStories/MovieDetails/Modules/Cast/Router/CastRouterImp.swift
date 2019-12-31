//
//  CastRouterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class CastRouterImp: CastRouterInput {
    
    weak var viewController: BaseHandlerController?
    
    func closeCurrentModule() {
        viewController?.closeModule()
    }
    
    func navigateToAboutArtist(with id: Int, and type: Int) {
        
    }
}
