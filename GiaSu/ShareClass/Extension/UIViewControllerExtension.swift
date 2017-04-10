//
//  UIViewControllerExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 5/12/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit
import SnapKit

extension UIViewController {
    func btr_replaceChildViewController(_ viewController : UIViewController? ,
                  withViewController destinationVC : UIViewController ,
                         insideContainer container : UIView) {
        if let currentChildVC = viewController {
            //Remove old child view controller
            btr_removeChildViewController(currentChildVC)
        }
        //Add new child view controller
        btr_addChildViewController(destinationVC, toContainer: container)
    }
    
    func btr_switchViewController(_ viewController: UIViewController?, withViewController destinationVC: UIViewController, insideContainter container: UIView) {
        if  let currentChildVC = viewController {
            currentChildVC.view.removeFromSuperview()
        }
        container.addSubview(destinationVC.view)
        destinationVC.view.snp.makeConstraints { (make) in
            make.edges.equalTo(container)
        }
    }
    
    func childViewControllerByClass(_ viewControllerClass: AnyClass) -> UIViewController? {
        for childVC in childViewControllers {
            if childVC.isKind(of: viewControllerClass) {
                return childVC
            }
        }
        return nil
    }
}

//MARK: helper
extension UIViewController {
    func btr_removeChildViewController(_ childViewController : UIViewController) {
        childViewController.willMove(toParentViewController: nil)
        childViewController.view.removeFromSuperview()
        childViewController.removeFromParentViewController()
    }
    
    func btr_addChildViewController(_ childViewController : UIViewController ,
                                            toContainer : UIView) {
        addChildViewController(childViewController)
        toContainer.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: self)
        childViewController.view.snp.makeConstraints { make in
            make.edges.equalTo(toContainer)
        }
    }
}

