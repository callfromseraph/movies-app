//
//  ReviewReviewViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 10/02/2020.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import UIKit

final class ReviewViewController: BaseViewController {

	// MARK: - Properties
	
	var presenter: ReviewPresenter!
	var router: ReviewRouterImp!

	// MARK: Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        router.viewController = self
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        ReviewModuleAssembly.instance().inject(into: self)
    }
}