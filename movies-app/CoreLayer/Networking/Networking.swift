//
//  Networking.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit

protocol Networking: class {
    
    func request(
        method: RequestMethod,
        route: String,
        parameters: [String: Any]?,
        headers: [String: String]?) -> Promise<Void>
    
    func request<T: Codable>(
        method: RequestMethod,
        route: String,
        parameters: [String: Any]?,
        headers: [String: String]?) -> Promise<T>
}
