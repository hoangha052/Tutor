//
//  AppearanceServices.swift
//  Bartr
//
//  Created by Thuy Luong on 5/16/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit

class AppearanceServices: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        customizeNavigationBarAppearance()
        customizeTabbarAppearance()
//        setIsFisrtStartApp()
        return true
    }
}

//MARK: NavigationBar
extension AppearanceServices {
    func customizeNavigationBarAppearance() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.darkGray
    }
}

//MARK: StatusBar
extension AppearanceServices {
    func customizeStatusBarAppearance() {
        UIApplication.shared.statusBarStyle = .default
    }
}

//MARK: Tabbar
extension AppearanceServices {
    func customizeTabbarAppearance() {
        UITabBar.appearance().tintColor = UIColor(rgba: "#f58027")
        UITabBar.appearance().backgroundColor = UIColor.white
    }
}

//MARK: ShowLandingPage
extension AppearanceServices {
    func setIsFisrtStartApp() {
        let reachedOfferCount = UserDefaults.standard.integer(forKey: Constants.UserDefaultKey.firstStartApp)
        if reachedOfferCount == 999 { return }
        else {
        UserDefaults.standard.set(999, forKey: Constants.UserDefaultKey.firstStartApp)
        }
    }
}
