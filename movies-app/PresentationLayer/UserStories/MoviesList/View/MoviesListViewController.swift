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
    
    var movies = [Movie]()
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MoviesListAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCell")
        
        router.viewController = self
        presenter.loadMovies { error in
            if error != nil {
                print(error)
            }
        }.done { movies in
            self.movies = movies.results
            self.collectionView.reloadData()
        }
    }
}

extension MoviesListViewController: UICollectionViewDelegate {
    
}

extension MoviesListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        let movie = self.movies[indexPath.item]
        cell.setContent(image: movie.posterPath, title: movie.title ?? "default", vote: movie.averageVote, adult: movie.adult ?? false)
        return cell
    }
}
