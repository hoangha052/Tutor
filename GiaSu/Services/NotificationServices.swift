//
//  NotificationServices.swift
//  Bartr
//
//  Created by Thuy Luong on 5/16/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import UIKit
//import RxSwift
//import FirebaseMessaging
//import FirebaseInstanceID

class NotificationServices: NSObject, UIApplicationDelegate {
    static let sharedInstance = NotificationServices()
    
//    var disposeBag = DisposeBag()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Local notifications
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(userDidLogout(_:)), name: Constants.Notification.UserDidLogout, object: nil)
        
        //Register remote notifications
        let notificationTypes: UIUserNotificationType = [UIUserNotificationType.alert, UIUserNotificationType.badge, UIUserNotificationType.sound]
        let pushNotificationSettings = UIUserNotificationSettings(types: notificationTypes, categories: nil)
        application.registerUserNotificationSettings(pushNotificationSettings)
        application.registerForRemoteNotifications()
        
//        FIRApp.configure()
        
        // Add observer for InstanceID token refresh callback.
//        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification),
//                                                         name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
//        if let launchOpts = launchOptions {
//            print("hsfhksafhaks")
//            UIAlertView.init(title: "", message: "werew", delegate: nil, cancelButtonTitle: "OK").show()
//            var notificationPayload: NSDictionary = launchOpts[UIApplicationLaunchOptionsKey.remoteNotification] as! NSDictionary
//        }
        return true
    }
    
    //Instance ID is long lived but, may be reset if the device is not used for a long time or the Instance ID service detects a problem. If Instance ID is reset, the app will be notified with a com.firebase.iid.token-refresh notification
    func tokenRefreshNotification(_ notification: Notification) {
//        if let refreshedToken = FIRInstanceID.instanceID().token() {
//            print("InstanceID token : \(refreshedToken)")
//            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notification.FCMTokenFetched), object: nil)
//        }
        
        // Connect to FCM since connection may have failed when attempted before having a token.
//        connectToFCM()
    }
    
//    func connectToFCM() {
//        FIRMessaging.messaging().connect { (error) in
//            if (error != nil) {
//                print("Unable to connect with FCM. \(error?.localizedDescription)")
//            } else {
//                debugPrint("FCM InstanceID token : \(FIRInstanceID.instanceID().token())")
//                print("Connected to FCM.")
//            }
//        }
//    }
    
//    func fetchFCMInstanceIdToken() -> Observable<AnyObject?> {
//        return Observable<AnyObject?>.create { observer -> Disposable in
//            FIRInstanceID.instanceID().getWithHandler({ (token, error) in
//                if let validToken = FIRInstanceID.instanceID().token() {
//                    observer.onNext(validToken as AnyObject?)
//                    observer.onCompleted()
//                }
//                if let validError = error {
//                    observer.onError(validError)
//                }
//            })
//            return Disposables.create()
//        }
//    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        connectToFCM()
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
//        var tokenString = NSString(format: "%@", deviceToken.description)
//        tokenString = tokenString.replacingOccurrences(of: "<", with: "") as NSString
//        tokenString = tokenString.replacingOccurrences(of: ">", with: "") as NSString
//        tokenString = tokenString.replacingOccurrences(of: " ", with: "") as NSString
//        
//        UserDefaults.standard.setValue(tokenString, forKey: Constants.UserDefaultKey.deviceToken)
//        
//        //Tricky
//        //FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: FIRInstanceIDAPNSTokenType.Unknown)
//        print("Device Token:", tokenString)
        
        
//        var token = ""
//        for i in 0..<deviceToken.count {
//            token = token + String(format: "%02.2hhx", arguments: [deviceToken[i]])
//        }
//        print(token)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        debugPrint(error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        debugPrint("push notification")
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        debugPrint("Received push notification")
//        NotificationManager.handleNotificationWithUserInfo(userInfo)
    }
    
    func userDidLogout(_ notific1ation: Notification) {
//        let window: UIWindow = UIApplication.shared.windows[0]
//        let signinViewController = UIStoryboard.tnr_createViewController(storyboardName: Constants.Storyboard.authentication, viewControllerIdentifier: String(describing: SignInViewController.self))
//        window.rootViewController = signinViewController
    }
}
