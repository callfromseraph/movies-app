//
//  BasePageViewControllerDelegate.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

protocol BasePageViewControllerDelegate: class {
    func pageDidChange(to index: Int)
}
