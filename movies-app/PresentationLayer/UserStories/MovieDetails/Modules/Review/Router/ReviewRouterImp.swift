//
//  ReviewReviewRouterImp.swift
//  movies-app
//
//  Created by David Petrosyan on 10/02/2020.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import Foundation

final class ReviewRouterImp: ReviewRouter {
	
	weak var viewController: BaseHandlerController?
    
    func closeCurrentModule() {
        viewController?.closeModule()
    }
}