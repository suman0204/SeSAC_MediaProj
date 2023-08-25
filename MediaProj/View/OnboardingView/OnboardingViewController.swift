//
//  OnboardingViewController.swift
//  MediaProj
//
//  Created by 홍수만 on 2023/08/25.
//

import UIKit

class OnboardingViewController: UIPageViewController {
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var pageList: [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        dataSource = self
        
        pageList = [FirstOnboardingViewController(), SecondOnboardingViewController()]
        view.backgroundColor = .systemGray
        
        guard let firstVC = pageList.first else { return }
        setViewControllers([firstVC], direction: .forward, animated: true)
    }
    


}

extension OnboardingViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pageList.firstIndex(of: viewController) else { return nil }
        
        let previousIndex = currentIndex - 1
        
        return previousIndex < 0 ? nil : pageList[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pageList.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        
        return nextIndex >= pageList.count ? nil : pageList[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageList.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = pageList.firstIndex(of: first) else { return 0 }
        return index
    }

}
