//
//  ProviderTabBar.swift
//  Tinry
//
//  Created by hoangha052 on 8/17/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

class ProviderTabBarViewController: BaseTabBarController, UITabBarControllerDelegate {

   var subViewControllers: [UIViewController]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
//        fistViewController()
        
    }
    
//    func fistViewController() {
//        let tripProvider = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.tripProvider, viewControllerIdentifier: "TouristMainViewController") as! TouristMainViewController
//        let navigationController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mainProvider, viewControllerIdentifier: "BookTouristNavigationController") as! UINavigationController
//        
//        navigationController.setViewControllers([tripProvider], animated: false)
//        self.viewControllers![0] = navigationController
//    }
//    
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        if self.selectedIndex == 0 {
//            // Get tab bar controller
//                fistViewController()
//        } else if self.selectedIndex == 1 {
//            self.resetOfferBadgeNumber()
//            tabBarController.viewControllers![1] = self.messageNVC
//            
//        } else if self.selectedIndex == 3 {
//                   // Get tab bar controller
//            let mainController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.main, viewControllerIdentifier: "AccountViewController") as! AccountViewController
//            mainController.isProvider = true
//            
//            let navigationController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mainProvider, viewControllerIdentifier: "AccountNavigationController") as! UINavigationController
//            navigationController.setViewControllers([mainController], animated: false)
//            
//            self.subViewControllers = tabBarController.viewControllers
//            tabBarController.viewControllers![3] = navigationController
//        } else if self.selectedIndex == 2 {
//            let mainController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mylisting, viewControllerIdentifier:"ReservationViewController") as! ReservationViewController
//    
//            let navigationController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mainProvider, viewControllerIdentifier: "MyListingNavigationController") as! UINavigationController
//            navigationController.setViewControllers([mainController], animated: false)
//            
//            self.subViewControllers = tabBarController.viewControllers
//            tabBarController.viewControllers![2] = navigationController
//        }
//        
//        
//    }
//    
//    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//        return true
//    }

}
