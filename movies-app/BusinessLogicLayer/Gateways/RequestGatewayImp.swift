//
//  RequestGatewayImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

final class RequestGatewayImp: RequestGateway {
    private var networking: Networking
    private var parameters: [String: Any]
    private var headers: [String: String]
    private var method: RequestMethod
    
    init(
        networking: Networking,
        parameters: [String: Any],
        headers: [String: String],
        method: RequestMethod
    ) {
        self.networking = networking
        self.parameters = parameters
        self.headers = headers
        self.method = method
    }
    
    func getResults<T>(route: String, parameters: [String: Any]?) -> Promise<T> where T: Codable {
        
        if let parameters = parameters {
            parameters.forEach { param in
                self.parameters[param.key] = param.value
            }
        }
        
        return Promise<T> { seal in
            networking.request(
                method: method,
                route: route,
                parameters: parameters,
                headers: headers
            ).done { result in
                seal.fulfill(result)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
