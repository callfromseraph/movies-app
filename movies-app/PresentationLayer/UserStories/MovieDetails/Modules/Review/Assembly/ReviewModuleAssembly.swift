//
//  ReviewReviewModuleAssembly.swift
//  movies-app
//
//  Created by David Petrosyan on 10/02/2020.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import EasyDi

final class ReviewModuleAssembly: Assembly {
	
	var router: ReviewRouterImp {
		return define(init: ReviewRouterImp())
	}

	var presenter: ReviewPresenter {
		return define(init:
			ReviewPresenterImp()
		)
	}

	func inject(into controller: ReviewViewController) {
		defineInjection(into: controller) {
			$0.presenter = self.presenter
			$0.router = self.router
            return $0
		}
	}
}
