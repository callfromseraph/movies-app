//
//  MoviesListDisplayManager.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

final class MoviesListDisplayManager: NSObject {
    private let reuseIdentifier = "movieCell"
    
    private var moviesListDataSource: MoviesListDataSourceOutput
    private var moviesListPresenter: MoviesListPresenter
    private var itemCount = 0
    
    weak var controller: BaseViewController?
    weak var delegate: MoviesListDisplayManagerDelegate?
    
    weak var moviesCollectionView: UICollectionView? {
        didSet {
            moviesCollectionView?.dataSource = self
            moviesCollectionView?.delegate = self
            moviesCollectionView?.register(UINib(nibName: "MovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)
        }
    }
    
    init(
        moviesListDataSource: MoviesListDataSourceOutput,
        moviesListPresenter: MoviesListPresenter
    ) {
        self.moviesListDataSource = moviesListDataSource
        self.moviesListPresenter = moviesListPresenter
        super.init()
        
        self.moviesListDataSource.delegate = self
    }
}

extension MoviesListDisplayManager: MoviesListDataSourceDelegate {
    
    func didAddMovies(with indexPaths: [IndexPath]) {
        moviesCollectionView?.performBatchUpdates({
            moviesCollectionView?.insertItems(at: indexPaths)
            itemCount += indexPaths.count
        }, completion: nil)
    }
}

extension MoviesListDisplayManager: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedMovie = self.moviesListDataSource.movies[indexPath.item]
        delegate?.didSelectMovie(with: selectedMovie.id)
    }
}

extension MoviesListDisplayManager: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else {
            fatalError("Failed to cast cell to MovieCollectionViewCell")
        }
        
        let movie = moviesListDataSource.movies[indexPath.item]
        cell.setContent(for: movie)
        return cell
    }
}

extension MoviesListDisplayManager: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = ((controller?.view.bounds.width)! - 32 - 16) / 2
        let height = width * 1.9
        return CGSize.init(width: width, height: height)
    }
}
