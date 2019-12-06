//
//  ModuleInput + ModuleInputProvider.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

protocol ModuleInput: class {
    
}

protocol ModuleInputProvider: class {
    var moduleInput: ModuleInput! { get }
}
