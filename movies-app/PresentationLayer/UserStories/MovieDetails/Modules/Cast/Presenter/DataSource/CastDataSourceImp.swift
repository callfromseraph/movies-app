//
//  CastDataSourceImp.swift
//  movies-app
//
//  Created by David Petrosyan on 12/20/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import Foundation

final class CastDataSourceImp: CastDataSourceInput, CastDataSourceOutput {
    
    weak var delegate: CastDataSourceDelegate?
    
    var credits: [Cast]
    
    init() {
        credits = []
    }
    
    func addCredits(_ credits: [Cast]) {
        self.credits = credits
        delegate?.didAddCredits(credits)
    }
}
