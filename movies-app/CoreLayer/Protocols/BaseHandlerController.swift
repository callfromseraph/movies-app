//
//  BaseHandlerController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

typealias ConfigurationClosure = (ModuleInput) -> Void

protocol BaseHandlerController: class {
    func openModule(with name: String)
    func openModule(with name: String, configurationClosure: @escaping ConfigurationClosure)
    func closeModule()
}
