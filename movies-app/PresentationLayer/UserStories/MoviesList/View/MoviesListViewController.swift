//
//  MoviesListViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

class MoviesListViewController: BaseViewController {
    
    var presenter: MoviesListPresenter!
    var router: MoviesListRouterImp!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MoviesListAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self
        presenter.loadMovies { error in
            if error != nil {
                print(error)
            }
        }
    }
}
