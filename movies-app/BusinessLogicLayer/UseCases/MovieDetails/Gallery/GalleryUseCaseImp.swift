//
//  GalleryUseCaseImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/13/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import PromiseKit

final class GalleryUseCaseImp: GalleryUseCase {
    
    private var requestGateway: RequestGateway
    
    init(requestGateway: RequestGateway) {
        self.requestGateway = requestGateway
    }
    
    func getGallery(route: String) -> Promise<[GalleryImage]> {
        return Promise<[GalleryImage]> { seal in
            requestGateway.getResults(
                route: route,
                parameters: ["include_image_language": "en,null"]
            ).done { (gallery: Gallery) in
                seal.fulfill(gallery.backdrops)
            }.catch { error in
                seal.reject(error)
            }
        }
    }
}
