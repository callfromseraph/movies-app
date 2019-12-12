//
//  GenresDisplayManager.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import UIKit

final class GenresDisplayManagerImp: NSObject {
    
    private let reuseIdentifier = "genreName"
    private var genresDataSource: GenresDataSourceOutput
    
    weak var delegate: GenresDisplayManagerDelegate?
    
    weak var genresCollectionView: UICollectionView? {
        didSet {
            genresCollectionView?.delegate = self
            genresCollectionView?.dataSource = self
        }
    }
    
    init(genresDataSource: GenresDataSourceOutput) {
        self.genresDataSource = genresDataSource
    }
}

extension GenresDisplayManagerImp: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.genresDataSource.genres.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: self.reuseIdentifier,
            for: indexPath
        ) as? GenreNameCollectionViewCell else { fatalError("Error cell tab name") }

        cell.set(title: genresDataSource.genres[indexPath.item].name)
        return cell
    }
}

extension GenresDisplayManagerImp: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectGenre(at: indexPath)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width:
                genresDataSource.genres[indexPath.item]
                .name.getSize(font: UIFont.TabName).width + 20,
                      height: 32)
    }
}
