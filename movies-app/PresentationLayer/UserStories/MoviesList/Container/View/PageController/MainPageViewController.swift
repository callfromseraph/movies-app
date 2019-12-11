//
//  MainPageViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

final class MainPageViewController: UIPageViewController, MainPageViewControllerHandler, ModuleInputProvider {
    
    weak var pageDelegate: MainPageViewControllerDelegate?
    
    var genres: [Genre] = []
    var viewPages: [UIViewController] = []
    var pagedViewControllers: [Genre: UIViewController] = [:]
    
    var moduleInput: ModuleInput!
    
    var currentViewController: UIViewController?
    var currentIndex: Int?
    var previousIndex: Int = 1
    private var pendingIndex: Int?
    
    private var storyboardName: String!
    
    func set(pages: [Genre], storyboardName: String) {
        self.storyboardName = storyboardName
        self.genres = pages
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController]?, direction: UIPageViewController.NavigationDirection, animated: Bool, completion: ((Bool) -> Void)? = nil) {
        super.setViewControllers(viewControllers, direction: direction, animated: animated, completion: completion)
        
        guard let viewController = viewControllers?.first else {
            fatalError("Could not set empty viewController")
        }
        self.currentViewController = viewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
    }
    
    func configureModule(with genre: Genre, configurationClosure: @escaping ConfigurationClosure) {
        
    }
    
    private func getViewController(with identifier: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(identifier: identifier)
    }
}

extension MainPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewPages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewPages.count > previousIndex else { return nil }
        
        if let pageController = pageViewController as? MainPageViewController {
            pageController.configureModule(with: pageController.genres[previousIndex]) { moduleInput in
                guard let moviesInput = moduleInput as? MoviesListPresenterInput else {
                    fatalError("Failed to cast moduleInput to MoviesListPresenter")
                }
                moviesInput.set(genre: pageController.genres[previousIndex], type: 0)
            }
        }
        
        return viewPages[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = viewPages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < viewPages.count else { return nil }
        guard viewPages.count > nextIndex else { return nil }

        if let pageController = pageViewController as? MainPageViewController {
            pageController.configureModule(with: pageController.genres[nextIndex]) { moduleInput in
                guard let moviesInput = moduleInput as? MoviesListPresenterInput else {
                    fatalError("Failed to cast moduleInput to MoviesListPresenter")
                }
                moviesInput.set(genre: pageController.genres[nextIndex], type: 0)
            }
        }

        return viewPages[nextIndex]
    }
}

extension MainPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = viewPages.firstIndex(of: pendingViewControllers.first!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            if let index = pendingIndex {
                currentIndex = index
                previousIndex = viewPages.firstIndex(of: previousViewControllers.last!)!
                pageDelegate?.pageDidChange(to: index, from: previousIndex)
            }
        }
    }
}
