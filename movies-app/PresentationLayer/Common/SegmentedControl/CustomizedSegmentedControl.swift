//
//  CustomizedSegmentedControl.swift
//  movies-app
//
//  Created by David Petrosyan on 12/16/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

final class CustomizedSegmentedControl: UISegmentedControl {
    
    var selectedTextColor: UIColor = .MainBackgroundColor
    var selectedTintColor: UIColor = .ActiveTextColor
    var notSelectedTextColor: UIColor = .TitleTextColor
    var notSelectedTintColor: UIColor = .SeparatorColor
    
    var previousSelectedIndex: Int?
    
    private lazy var tabViews: [UIView] = {
        var tabViews = [UIView]()
        for tab in self.subviews {
            tabViews.append(tab)
        }
        return tabViews
    }()
    
    weak var delegate: SegmentedControlDelegate?
    
    private func setActiveTintColor(for index: Int) {
        if let previousIndex = previousSelectedIndex {
            tabViews[previousIndex].tintColor = notSelectedTintColor
        }
        previousSelectedIndex = index
        tabViews[index].tintColor = selectedTintColor
    }
    
    override var selectedSegmentIndex: Int {
        didSet {
            setActiveTintColor(for: selectedSegmentIndex)
            delegate?.didSelectTab(at: self.selectedSegmentIndex)
        }
    }
    
    override func awakeFromNib() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: notSelectedTextColor], for: .normal)
        self.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedTextColor], for: .selected)
        self.tintColor = notSelectedTintColor
        self.addTarget(self, action: #selector(tabChanged), for: .valueChanged)
        setActiveTintColor(for: self.selectedSegmentIndex)
    }

    @objc private func tabChanged(_ sender: UISegmentedControl) {
        delegate?.didSelectTab(at: self.selectedSegmentIndex)
        setActiveTintColor(for: sender.selectedSegmentIndex)
    }
}
