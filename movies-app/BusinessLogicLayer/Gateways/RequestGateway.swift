//
//  RequestGateway.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

protocol RequestGateway: class {
    func getResults<T: Codable>(route: String, parameters: [String: Any]?) -> Promise<T>
}
