//
//  MovieDetailsViewController.swift
//  movies-app
//
//  Created by David Petrosyan on 12/16/19.
//  Copyright © 2019 David Petrosyan. All rights reserved.
//

import UIKit

class MovieDetailsViewController: BaseViewController {
    
    private let pages = ["info", "cast", "review"]
    private let storyboardName = L10n.MovieDetails.storyboardName
    private var firstPage: BaseViewController!
    private var pageViewController: BasePageViewController?
    
    @IBOutlet weak var segmentedControl: CustomizedSegmentedControl! {
        didSet {
            segmentedControl.delegate = self
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let pageView = segue.destination as? BasePageViewController {
            pageView.set(pages: pages, storyboardName: storyboardName)

            pageViewController = pageView

            guard let firstPage = pageView.viewPages.first else {
                fatalError("Failed to define first page")
            }
            self.firstPage = firstPage as? BaseViewController

            pageView.setViewControllers([firstPage], direction: .forward, animated: true, completion: nil)

            pageView.pageDelegate = self

        }
    }
    
    private func customize() {
        view.backgroundColor = .MainBackgroundColor
        navigationController?.navigationBar.tintColor = .TitleTextColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MovieDetailsAssembly.instance().inject(into: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let moduleInput = moduleInput as? MovieDetailsPresenterInput else {
            return assertionFailure("Failed to cast moduleInput to MovieDetailsPresenterInput")
        }
        navigationItem.title = moduleInput.type == 0 ? "movie" : "tv"
    }
}

extension MovieDetailsViewController: BasePageViewControllerDelegate {
    
    func pageDidChange(to index: Int) {
        segmentedControl.selectedSegmentIndex = index
    }
}

extension MovieDetailsViewController: SegmentedControlDelegate {
    
    func didSelectTab(at index: Int) {
        var direction: UIPageViewController.NavigationDirection = .forward
        if let previousIndex = segmentedControl.previousSelectedIndex, previousIndex > index {
            direction = .reverse
        }
        
        pageViewController?.setViewControllers(
            [(pageViewController?.viewPages[index])!],
            direction: direction,
            animated: true,
            completion: nil
        )
    }
}
