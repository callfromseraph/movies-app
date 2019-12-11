//
//  MainPageViewControllerHandler.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

protocol MainPageViewControllerHandler: class {
    var genres: [Genre] { get }
    var viewPages: [UIViewController] { get }
    var pagedViewControllers: [Genre: UIViewController] { get }
    var pageDelegate: MainPageViewControllerDelegate? { get set }
    
    func set(pages: [Genre], storyboardName: String)
}
