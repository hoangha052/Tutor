//
//  BaseTabBarController.swift
//  Tinry
//
//  Created by hoangha052 on 11/23/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit


class BaseTabBarController: UITabBarController {

    var notificationView = UIView()
    var timer: Timer?
    var notificationData: [String: AnyObject]?
    
//    lazy var messageNVC: UINavigationController = {
        
//        let mainController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.message, viewControllerIdentifier: String(describing: ListMessageViewController.self)) as! ListMessageViewController
//        let navigationController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.main, viewControllerIdentifier: "MessageNavigationController") as! UINavigationController
//        
//        navigationController.setViewControllers([mainController], animated: false)
//        return navigationController
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        initNotificationView()
    }
    
    func addObservers() {
        // Remote Notification
        NotificationCenter.default.addObserver(self, selector: #selector(flightReceived(_:)), name: NSNotification.Name(rawValue: Constants.Notification.Flight), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(messageOfferReceived(_:)), name: NSNotification.Name(rawValue: Constants.Notification.AccommodationOffer), object: nil)
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    deinit {
        removeObserver()
    }
}

extension BaseTabBarController {
    func initNotificationView() {
        notificationView.backgroundColor = UIColor(rgba: "#db833a")
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchOnNotificationView))
        notificationView.addGestureRecognizer(tapGesture)
        
        let notificationLabel = UILabel()
        notificationLabel.tag = 99
        notificationLabel.font = UIFont(name: "HelveticaNeue", size: 13)
        notificationLabel.textColor = UIColor.white
        notificationLabel.textAlignment = NSTextAlignment.center
        notificationLabel.numberOfLines = 0
        notificationLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        notificationView.addSubview(notificationLabel)
        
        notificationLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(notificationView).inset(UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0))
        }
        
        notificationView.frame = CGRect(x: 0, y: -64, width: UIScreen.main.bounds.width, height: 64)
        
        let window = UIApplication.shared.keyWindow
        window!.addSubview(notificationView)
        window!.bringSubview(toFront: notificationView)
    }
}

//MARK: Notification
extension BaseTabBarController {
    func imagePickDone(_ notification: Notification) {
    }
    
    func showNotificationMessage(_ message: String?) {
        let notificationLabel = notificationView.viewWithTag(99) as! UILabel
        notificationLabel.text = message
        
        UIView.animate(withDuration: 0.5, animations: {
            self.notificationView.updateY(0)
            self.view.setNeedsLayout()
            self.view.layoutIfNeeded()
            
        }, completion: { (completed) in
            self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.dismissNotificationView), userInfo: nil, repeats: false)
            UIApplication.shared.beginBackgroundTask(expirationHandler: {
                self.timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.dismissNotificationView), userInfo: nil, repeats: false)
            })
        })
    }
    
    func flightReceived(_ notification: Notification) {
        if let userInfo = notification.userInfo as? [String: AnyObject] {
            notificationData = userInfo
            showNotificationMessage(userInfo["Message"] as? String)
        }
    }
    
    func messageOfferReceived(_ notification: Notification) {
        // mark need reload messages
        if let userInfo = notification.userInfo as? [String: AnyObject] {
            if let code = userInfo["Code"] as? String,
                code != NotificationPayloadCode.ActivityOfferNoAction.rawValue,
                code != NotificationPayloadCode.AccommodationOfferNoAction.rawValue,
                code != NotificationPayloadCode.TransportationOfferNoAction.rawValue {
                
                UserDefaults.standard.set(true, forKey: Constants.UserDefaultKey.reloadMessage)
                updateOfferBadgeNumber()
            }
            notificationData = userInfo
            showNotificationMessage(userInfo["Message"] as? String)
        }
    }
    
    func touchOnNotificationView() {
        dismissNotificationView()
    }
    
    func dismissNotificationView() {
        self.timer?.invalidate()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.notificationView.updateY(-64)
            //            self.view.setNeedsLayout()
            //            self.view.layoutIfNeeded()
        })
    }
    
    func updateOfferBadgeNumber() {
        var badge = 0
        let reachedOfferCount = UserDefaults.standard.integer(forKey: Constants.UserDefaultKey.newMessageCount)
        //        print("badgeCount ---\(badge)")
        badge = reachedOfferCount + 1
        
        UserDefaults.standard.set(badge, forKey: Constants.UserDefaultKey.newMessageCount)
        self.tabBar.items![1].badgeValue = "\(badge)"
    }
    
    func resetOfferBadgeNumber() {
        UserDefaults.standard.set(0, forKey: Constants.UserDefaultKey.newMessageCount)
        self.tabBar.items![1].badgeValue = nil
    }
}

