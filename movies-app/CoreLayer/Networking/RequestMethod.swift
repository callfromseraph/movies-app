//
//  RequestMethod.swift
//  movies-app
//
//  Created by David Petrosyan on 12/9/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Alamofire

enum RequestMethod: String {
    case GET, POST
    
    func alamofireMethod() -> HTTPMethod {
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        }
    }
}
