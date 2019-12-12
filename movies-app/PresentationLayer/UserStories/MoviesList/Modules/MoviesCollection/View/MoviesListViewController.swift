//
//  MoviesListViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/10/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit
import PromiseKit

class MoviesListViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: MoviesListPresenter!
    var router: MoviesListRouterImp!
    
    var moviesDisplayManager: MoviesListDisplayManager! {
        didSet {
            moviesDisplayManager.delegate = self
            moviesDisplayManager.controller = self
        }
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MoviesListAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        router.viewController = self
        moviesDisplayManager.moviesCollectionView = collectionView
        presenter.loadMovies { error in
            if error != nil {
                print(error)
            }
        }
    }
}

extension MoviesListViewController: MoviesListDisplayManagerDelegate {
    
    func didSelectMovie(with id: Int) {
//        call to router
    }
}
