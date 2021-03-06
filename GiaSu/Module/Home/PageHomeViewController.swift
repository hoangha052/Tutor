//
//  PageHomeViewController.swift
//  GiaSu
//
//  Created by hoangha052 on 4/3/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit


protocol HomePageViewDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tripPageViewController: the TripPageViewController instance
     - parameter count: the total number of pages.
     */
    func listingPageViewController(_ reservationViewController: PageHomeViewController,
                                   didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tinryPageViewController: the TinryPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func listingPageViewController(_ reservationViewController: PageHomeViewController,
                                   didUpdatePageIndex index: Int)
    
}


class PageHomeViewController:  UIPageViewController {
    
    weak var homePageViewDelegate: HomePageViewDelegate?
    
    fileprivate(set) lazy var orderedViewControllers: [UIViewController] = {
        let profileVC = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.main, viewControllerIdentifier: String(describing: ProfileInfoViewController.self)) as! ProfileInfoViewController
        
        let profileVC2 = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.main, viewControllerIdentifier: String(describing: ProfileInfoViewController.self)) as! ProfileInfoViewController

        return [profileVC, profileVC2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        if let initialViewController = orderedViewControllers.first as? ProfileInfoViewController {
            scrollToViewController(initialViewController)
             print("pageViewController")
        }
       
    }
    
}

//MARK: Scrolling Handle
extension PageHomeViewController {
    func selectViewControllerAtIndex(_ index: Int) {
        self.scrollToViewController(index: index)
    }
    
    /**
     Scrolls to the next view controller.
     */
    func scrollToNextViewController() {
        if let visibleViewController = viewControllers?.first,
            let nextViewController = pageViewController(self,
                                                        viewControllerAfter: visibleViewController) {
            scrollToViewController(nextViewController)
        }
    }
    
    /**
     Scrolls to the view controller at the given index. Automatically calculates
     the direction.
     
     - parameter newIndex: the new index to scroll to
     */
    func scrollToViewController(index newIndex: Int) {
        if let firstViewController = viewControllers?.first,
            let currentIndex = orderedViewControllers.index(of: firstViewController) {
            
            let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .forward : .reverse
            let nextViewController = orderedViewControllers[newIndex]
            scrollToViewController(nextViewController, direction: direction)
        }
    }
    
    /**
     Scrolls to the given 'viewController' page.
     
     - parameter viewController: the view controller to show.
     */
    fileprivate func scrollToViewController(_ viewController: UIViewController,
                                            direction: UIPageViewControllerNavigationDirection = .forward) {
        setViewControllers([viewController],
                           direction: direction,
                           animated: true,
                           completion: { (finished) -> Void in
                            // Setting the view controller programmatically does not fire
                            // any delegate methods, so we have to manually notify the
                            // 'tutorialDelegate' of the new index.
                            self.notifyTutorialDelegateOfNewIndex()
        })
    }
    
    /**
     Notifies '_tutorialDelegate' that the current page index was updated.
     */
    fileprivate func notifyTutorialDelegateOfNewIndex() {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            homePageViewDelegate?.listingPageViewController(self, didUpdatePageIndex: index)
        }
    }
}

//MARK: UIPageViewControllerDataSource
extension PageHomeViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
            return nil
            //            return orderedViewControllers.last //for loop
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        guard orderedViewControllersCount != nextIndex else {
            //            return orderedViewControllers.first // for loop
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}

//MARK: UIPageViewControllerDelegate
extension PageHomeViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        notifyTutorialDelegateOfNewIndex()
    }
    
}
