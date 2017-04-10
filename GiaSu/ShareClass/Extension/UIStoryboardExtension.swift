//
//  UIStoryboardExtension.swift
//  Bartr
//
//  Created by Thuy Luong on 5/12/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

extension UIStoryboard {
    class func tnr_createViewController(storyboardName name : String ,
                    viewControllerIdentifier idenfitier : String? = nil) -> UIViewController {
        let storyboard = UIStoryboard(name: name, bundle: nil)
        if let validIdentifier = idenfitier {
            return storyboard.instantiateViewController(withIdentifier: validIdentifier)
        }
        return storyboard.instantiateInitialViewController()!
    }
}
