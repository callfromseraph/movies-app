//
//  GalleryUseCase.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

protocol GalleryUseCase: class {
    func getGallery(route: String) -> Promise<[GalleryImage]>
}
