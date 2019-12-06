//
//  BaseRoutingProtocol.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

protocol BaseRoutingProtocol: class {
    var viewController: BaseHandlerController? { get set }
    
    func closeCurrentModule()
}
