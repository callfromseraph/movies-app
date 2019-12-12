//
//  MainPageViewControllerDelegate.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol MainPageViewControllerDelegate: class {
    func pageDidChange(toIndex: Int, fromIndex: Int)
}
