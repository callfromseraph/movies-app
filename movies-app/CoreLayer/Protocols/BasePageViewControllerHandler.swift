//
//  BasePageViewControllerHandler.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

protocol BasePageViewControllerHandler: class {
    var viewPages: [UIViewController] { get }
    var pageDelegate: BasePageViewControllerDelegate? { get set }
    
    func set(pages: [String], storyboardName: String)
}
