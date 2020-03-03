//
//  MovieInfoViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 2/10/20.
//  Copyright © 2020 David Petrosyan. All rights reserved.
//

import UIKit

class MovieInfoViewController: BaseViewController {
    
    // MARK: - Properties
    
    var presenter: MovieInfoPresenter!
    var router: MovieInfoRouterImp!
    
    // MARK: Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        router.viewController = self
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MovieInfoAssembly.instance().inject(into: self)
    }
}
