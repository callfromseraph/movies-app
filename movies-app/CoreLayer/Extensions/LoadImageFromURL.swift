//
//  LoadImageFromURL.swift
//  movies-app
//
//  Created by David Petrosyan on 12/11/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    
    func downloadedFrom(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        self.kf.setImage(with: url)
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async {
//                self.image = image
//            }
//        }.resume()
    }
    
    func downloadedFrom(link: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        
        if let link = link, let url = URL(string: L10n.baseURLForImages + link) {
            downloadedFrom(url: url, contentMode: mode)
        } else {
//            self.image = Asset.examplePoster.image
        }
    }
}
