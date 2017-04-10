//
//  MainServices.swift
//  Bartr
//
//  Created by Thuy Luong on 5/16/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class MainServices: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        IQKeyboardManager.sharedManager().enable = true
//        IQKeyboardManager.sharedManager().disabledDistanceHandlingClasses.append(SignInViewController.self)
        
//        IQKeyboardManager.sharedManager().disableDistanceHandlingInViewControllerClass(SignInViewController.self)
        
        return true
    }
}
