//
//  StringSize.swift
//  movies-app
//
//  Created by David Petrosyan on 12/12/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func getSize(font: UIFont) -> CGSize {
        let attrString = NSAttributedString(string: self, attributes: [.font: font])
        return attrString.size()
    }
}
