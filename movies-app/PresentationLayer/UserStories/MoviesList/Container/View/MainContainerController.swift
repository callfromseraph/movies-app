//
//  MainContainerController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

final class MainContainerController: BaseViewController {

    @IBOutlet weak var genresCollectionView: UICollectionView!
    
    private let storyboardName = L10n.Movies.storyboardName
    private var firstPage: UIViewController!
    private var pageViewController: MainPageViewController!
    
    var genres: [Genre]!
    var genresPresenter: GenresPresenter!
    var router: MoviesContainerRouter!
    var genresDisplayManager: GenresDisplayManagerImp!
    var genresDataSource: GenresDataSourceOutput!
    
    func customize() {
        view.backgroundColor = UIColor.MainBackgroundColor
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear

        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.TitleTextColor,
            .font: UIFont.AppName
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageView = segue.destination as? MainPageViewController {
            self.pageViewController = pageView
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MoviesContainerAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
        genresDisplayManager.genresCollectionView = self.genresCollectionView
        genresDisplayManager.delegate = self
        genresDataSource.delegate = self
        router.viewController = self
        genresPresenter.setGenres { error in
            print(error?.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = Bundle.main.object(forInfoDictionaryKey: "AppName") as? String
    }
}

extension MainContainerController: GenresDelegate {
    
    func didAddGenres(_ genres: [Genre]) {
        self.genresCollectionView.reloadData()
        self.genresCollectionView.layoutIfNeeded()
        
        self.genres = genres
        
        pageViewController.set(pages: genres, storyboardName: storyboardName)
        pageViewController.configureModule(with: genres[1]) { moduleInput in
            guard let moviesInput = moduleInput as? MoviesListPresenterInput else {
                fatalError("Failed to cast moduleInput to MoviesListPresenterInput")
            }
            moviesInput.set(genre: self.genres[1], type: 0)
        }
        guard let firstPage = pageViewController.pagedViewControllers[genres[1]] else {
            fatalError("Failed to find first page")
        }
        self.firstPage = firstPage
        pageViewController.pageDelegate = self
        pageViewController.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)
        
        DispatchQueue.main.async {
            self.genresCollectionView.selectItem(
                at: IndexPath(item: 1, section: 0),
                animated: true,
                scrollPosition: .centeredHorizontally)
        }
    }
}

extension MainContainerController: GenresDisplayManagerDelegate {
    
    func didSelectGenre(at indexPath: IndexPath) {
        let openPage = pageViewController.pagedViewControllers[genres[indexPath.item]]
        pageViewController.configureModule(with: genres[indexPath.item]) { moduleInput in
            guard let moviesInput = moduleInput as? MoviesListPresenterInput else {
                fatalError("Failed to cast moduleInput to MoviesListPresenterInput")
            }
            moviesInput.set(genre: self.genres[indexPath.item], type: 0)
            guard
                let openPage = openPage,
                let currentPage = self.pageViewController.currentViewController
                else {
                    fatalError("Current page or opening page is nil")
            }
            let index = self.pageViewController.viewPages.firstIndex(of: currentPage)
            guard let validIndex = index else {
                fatalError("")
            }
            let direction: UIPageViewController.NavigationDirection = (validIndex < indexPath.item) ? .forward : .reverse
            self.pageViewController.setViewControllers([openPage], direction: direction, animated: true) { finished in
                if finished {
                    self.genresCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
                }
            }
        }
    }
}

extension MainContainerController: MainPageViewControllerDelegate {
    
    func pageDidChange(toIndex: Int, fromIndex: Int) {
        self.genresCollectionView.selectItem(
            at: IndexPath(item: toIndex, section: 0),
            animated: true,
            scrollPosition: .centeredHorizontally)
    }
}
