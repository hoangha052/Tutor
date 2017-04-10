//
//  BartrTabBarController.swift
//  Bartr
//
//  Created by Thuy Luong on 5/16/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit
import SnapKit

class TinryTabBarController: BaseTabBarController {
    var centerButton: UIButton!
    var isHighLighted:Bool = false
//    var notificationView = UIView()
//    var timer: Timer?
//    var notificationData: [String: AnyObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        
//        let middleImage:UIImage = UIImage(named:"CameraTab")!
//        let highlightedMiddleImage:UIImage = UIImage(named:"CameraTab")!
//        addCenterButtonWithImage(middleImage, highlightImage: highlightedMiddleImage)
//        
//        addObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        initNotificationView()
    }
    
//    func addObservers() {
//        // Remote Notification
//        NotificationCenter.default.addObserver(self, selector: #selector(flightReceived(_:)), name: NSNotification.Name(rawValue: Constants.Notification.Flight), object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(messageOfferReceived(_:)), name: NSNotification.Name(rawValue: Constants.Notification.AccommodationOffer), object: nil)
//    }
//    
//    func removeObserver() {
//        NotificationCenter.default.removeObserver(self)
//    }
//    
//    deinit {
//        removeObserver()
//    }

}
/*
//MARK: Helper
extension TinryTabBarController {
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
*/
//MARK: UITabBarControllerDelegate
extension TinryTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        if self.selectedIndex == 1 {
            self.resetOfferBadgeNumber()
//            let mainController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.message, viewControllerIdentifier: String(describing: ListMessageViewController.self)) as! ListMessageViewController
            
//            let navigationController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.main, viewControllerIdentifier: "MessageNavigationController") as! UINavigationController
//            navigationController.setViewControllers([self.messageVC], animated: false)
            
//            tabBarController.viewControllers![1] = messageNVC
        }
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
       return true
//        if selectedViewController == viewController {
//            debugPrint("Select a controller in tabbar twice")
//            return false;
//        }
//        
//        guard let _ = UserManager.sharedInstance.savedUser() else {
//            let signupRequestVC = UIStoryboard.btr_createViewController(storyboardName: Constants.Storyboard.authentication, viewControllerIdentifier: String(SignupRequestViewController.self)) as! SignupRequestViewController
//            signupRequestVC.modalPresentationStyle = .OverFullScreen
//            signupRequestVC.modalTransitionStyle = .CrossDissolve
//            self.presentViewController(signupRequestVC, animated: true, completion: nil)
            
//            return false
//        }
//        
//        return true
    }

}


//MARK : MIDDLE TAB BAR HANDLE
extension TinryTabBarController {
    func addCenterButtonWithImage(_ buttonImage: UIImage, highlightImage: UIImage?) {
        let buttonFrame = CGRect(x: 140, y: 420, width: 60, height: 60)
        centerButton = UIButton(frame: buttonFrame)
        
        centerButton.setImage(buttonImage, for: UIControlState())
        //centerButton.setBackgroundImage(highlightImage, forState: UIControlState.Highlighted)
        
        centerButton.addTarget(self, action: #selector(performImagePicker(_:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(centerButton)
        
        centerButton.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.height.equalTo(60)
            make.bottom.equalTo(self.view.snp.bottom).offset(-5)
        }
    }
    
    
    func performImagePicker(_ sender: UIButton)
    {
//        guard let _ = UserManager.sharedInstance.savedUser() else {
//            let signupRequestVC = UIStoryboard.btr_createViewController(storyboardName: Constants.Storyboard.authentication, viewControllerIdentifier: String(SignupRequestViewController.self)) as! SignupRequestViewController
//            signupRequestVC.modalPresentationStyle = .OverFullScreen
//            signupRequestVC.modalTransitionStyle = .CrossDissolve
//            self.presentViewController(signupRequestVC, animated: true, completion: nil)
            
            return
        }
        
//        let postNavigationController = UIStoryboard.btr_createViewController(storyboardName: Constants.Storyboard.imagePicker) as! UINavigationController
//        let imageCaptureVC = postNavigationController.viewControllers[0] as! ImageCaptureViewController
//        imageCaptureVC.presentForChangeImage = false
//        self.presentViewController(postNavigationController, animated: true, completion: nil)
        
//    }
}

/*
//MARK: Notification
extension TinryTabBarController {
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
        updateOfferBadgeNumber()
        if let userInfo = notification.userInfo as? [String: AnyObject] {
            notificationData = userInfo
            showNotificationMessage(userInfo["Message"] as? String)
        }
    }
    
    func touchOnNotificationView() {
        if let validNotificationData = notificationData {
            if let code = validNotificationData["Code"] as? String, code == NotificationPayloadCode.Flight.rawValue {
                let flightDetailVC = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.offer, viewControllerIdentifier: String(describing: FlightDetailViewController.self)) as! FlightDetailViewController
                let flightDetailVM = FlightDetailViewModel(flightOfferId: validNotificationData["FlightOfferId"] as! String, tripProfileId: validNotificationData["TripProfileId"] as! Int)
                flightDetailVC.viewModel = flightDetailVM
                flightDetailVC.performFromNotification = true
                
                let navController = UINavigationController(rootViewController: flightDetailVC)
                if let presentedVC = self.presentedViewController {
                    presentedVC.present(navController, animated: true, completion: nil)
                }
                else {
                    self.present(navController, animated: true, completion: nil)
                }
            } else if let code = validNotificationData["Code"] as? String, code == NotificationPayloadCode.Accommodation.rawValue {
                let accommodationDetailVC = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mylisting, viewControllerIdentifier: String(describing: CreateAccommodationViewController.self)) as! CreateAccommodationViewController
                if let data = validNotificationData["AccommodationOffer"] as? [String: AnyObject] {
                    accommodationDetailVC.accommodationDetaill = Accommodation.init(json: data)
                    accommodationDetailVC.isShowDetailView = true
                    accommodationDetailVC.isPresentView = true
                    let navController = UINavigationController(rootViewController: accommodationDetailVC)
                    if let presentedVC = self.presentedViewController {
                        presentedVC.present(navController, animated: true, completion: nil)
                    }
                    else {
                        self.present(navController, animated: true, completion: nil)
                    }
                }
                } else  if let code = validNotificationData["Code"] as? String, code == NotificationPayloadCode.Transportation.rawValue {
                let transportationDetailVC = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mylisting, viewControllerIdentifier: String(describing: CreateTransportViewController.self)) as! CreateTransportViewController
                if let data = validNotificationData["TransportationOffer"] as? [String: AnyObject] {
                    transportationDetailVC.transportDetaill = TransportOffer.init(json: data)
                    transportationDetailVC.isShowDetailView = true
                    transportationDetailVC.isPresentView = true
                    let navController = UINavigationController(rootViewController: transportationDetailVC)
                    if let presentedVC = self.presentedViewController {
                        presentedVC.present(navController, animated: true, completion: nil)
                    }
                    else {
                        self.present(navController, animated: true, completion: nil)
                    }
                }
            } else  if let code = validNotificationData["Code"] as? String, code == NotificationPayloadCode.Activity.rawValue {
                let activityDetailVC = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.mylisting, viewControllerIdentifier: String(describing: CreateActivityViewController.self)) as! CreateActivityViewController
                if let data = validNotificationData["ActivityOffer"] as? [String: AnyObject] {
                    activityDetailVC.activityDeatail = Activity.init(json: data)
                    activityDetailVC.isShowDetailView = true
                    activityDetailVC.isPresentView = true
                    let navController = UINavigationController(rootViewController: activityDetailVC)
                    if let presentedVC = self.presentedViewController {
                        presentedVC.present(navController, animated: true, completion: nil)
                    }
                    else {
                        self.present(navController, animated: true, completion: nil)
                    }
                }
            }
        }
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
 */
