//
//  FacebookHandlerServices.swift
//  Bartr
//
//  Created by Thuy Luong on 5/20/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

class FacebookHandlerServices: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
    
//        return FBSDKApplicationDelegate.sharedInstance().application(
//            application,
//            open: url,
//            sourceApplication: sourceApplication,
//            annotation: annotation)
//    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        FBSDKAppEvents.activateApp()
    }
}
