//
//  BasePageViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

class BasePageViewController: UIPageViewController, BasePageViewControllerHandler, ModuleInputProvider {
    
    var moduleInput: ModuleInput!
    var storyboardName = "Main"
    var viewPages: [UIViewController] = []
    
    weak var pageDelegate: BasePageViewControllerDelegate?
    
    private var currentIndex: Int?
    private var pendingIndex: Int?
    
    func set(pages: [String], storyboardName: String) {
        self.storyboardName = storyboardName
        pages.forEach { page in
            viewPages.append(getViewController(with: page))
        }
    }
    
    func getViewController(with identifier: String) -> UIViewController {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(identifier: identifier)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
    }
}

extension BasePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        pendingIndex = viewPages.firstIndex(of: pendingViewControllers.first!)
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        didFinishAnimating finished: Bool,
        previousViewControllers: [UIViewController],
        transitionCompleted completed: Bool
    ) {
        if completed {
            currentIndex = pendingIndex
            if let index = currentIndex {
                pageDelegate?.pageDidChange(to: index)
            }
        }
    }
}

extension BasePageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController
    ) -> UIViewController? {
        guard let viewControllerIndex = viewPages.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewPages.count > previousIndex else { return nil }
        return viewPages[previousIndex]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController
    ) -> UIViewController? {
        guard let viewControllerIndex = viewPages.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard nextIndex < viewPages.count else { return nil }
        guard viewPages.count > nextIndex else { return nil }
        return viewPages[nextIndex]
    }
}
