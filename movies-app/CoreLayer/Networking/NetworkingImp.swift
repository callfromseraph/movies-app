//
//  NetworkingImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/6/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

final class NetworkingImp: Networking {
    
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func request(method: RequestMethod, route: String, parameters: [String: Any]?, headers: [String: String]?) -> Promise<Void> {
        return Promise { seal in
            let URL = self.baseURL + route
            let headers = headers ?? [:]
            Alamofire.request(URL, method: method.alamofireMethod(), parameters: parameters, headers: headers)
                .validate()
                .responseJSON { response in
                    if let error = response.result.error {
                        seal.reject(error)
                    } else {
                        seal.fulfill_()
                    }
                }
        }
    }
    
    func request<T>(
        method: RequestMethod,
        route: String,
        parameters: [String: Any]?,
        headers: [String: String]?
    ) -> Promise<T> where T: Codable {
        return Promise<T> { seal in
            let URL = self.baseURL + route
            let headers = headers ?? [:]
            Alamofire.request(URL, method: method.alamofireMethod(), parameters: parameters, headers: headers)
                .validate()
                .responseObject { (response: DataResponse<T>) in
                    if let error = response.result.error {
                        seal.reject(error)
                    } else {
                        guard let value = response.result.value else {
                            return seal.reject(NetworkingError.corruptedData)
                        }
                        seal.fulfill(value)
                    }
                }
        }
    }
}
