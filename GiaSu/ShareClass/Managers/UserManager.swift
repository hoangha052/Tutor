//
//  UserManager.swift
//  Bartr
//
//  Created by Thuy Luong on 5/25/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import RxSwift
//import RxCocoa
//import CoreLocation
//import FirebaseMessaging

class UserManager: NSObject {
    
    static let sharedInstance = UserManager()
    /*
    var loggedInUser: User?
//    var currentLocation : CLLocationCoordinate2D?
    var currentLocation: Variable<CLLocationCoordinate2D?> = Variable(nil)
    var locationManager = CLLocationManager()
    var currentAddress: String?
    var disposeBag = DisposeBag()
    var senderUser: User?
    
    override init() {
        super.init()
        self.startRequestingLocation()
    }
    
    func startRequestingLocation() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 100
            locationManager.delegate = self
            locationManager.startUpdatingLocation()
            
//            locationManager.didUpdateLocations.subscribeNext { [unowned self] location in
//                self.currentLocation = location.first?.coordinate
//                self.locationManager.stopUpdatingLocation()
//            }.addDisposableTo(disposeBag)
        }
    }
    
    class func saveFacebookToken(_ token: String, email: String) {
        UserDefaults.standard.set(token, forKey: Constants.UserDefaultKey.facebookToken)
        UserDefaults.standard.set(email, forKey: Constants.UserDefaultKey.facebookEmail)
    }
    
    class func facebookToken() -> String? {
        return UserDefaults.standard.object(forKey: Constants.UserDefaultKey.facebookToken) as? String
    }
    
    class func facebookEmail() -> String? {
        return UserDefaults.standard.object(forKey: Constants.UserDefaultKey.facebookEmail) as? String
    }
    
    class func saveUser(_ user: User) {
        let prefs = UserDefaults.standard
        let encodedUserData = NSKeyedArchiver.archivedData(withRootObject: user)
        prefs.set(encodedUserData, forKey: "User")
        prefs.synchronize()
    }
    
    func savedUser() -> User? {
        guard loggedInUser == nil else {
            return loggedInUser
        }
        
        let prefs = UserDefaults.standard
        if let encodedUserData = prefs.object(forKey: "User") as? Data {
            loggedInUser = NSKeyedUnarchiver.unarchiveObject(with: encodedUserData) as? User
        }
        return loggedInUser
    }
    
    class func subscribeTopicForPushNotification(_ user: User) {
        if let clientKey = user.clientKey {
            FIRMessaging.messaging().subscribe(toTopic: "/topics/\(clientKey)")
        }
    }
    
    func logout() {
        guard loggedInUser == nil else {
            if let clientKey = loggedInUser!.clientKey {
                FIRMessaging.messaging().unsubscribe(fromTopic: "/topics/\(clientKey)")
            }

            loggedInUser = nil
            let prefs = UserDefaults.standard
            prefs.removeObject(forKey: "User")
            prefs.synchronize()
            return
        }
    }
    
    func checkCurrentUserForUserId(_ userId: Int) -> Bool {
        if let validUser = loggedInUser {
            return userId == validUser.userId
        }
        return false
    }
    
    func displayLocationInfo(_ placemark: CLPlacemark) {
        
        //stop updating location to save battery life
        //            locationManager.stopUpdatingLocation()
        currentAddress = placemark.name
    }
    */
}

//MARK: User location
//extension UserManager {
//    func getCurrentLocation(forcedReload reload: Bool = false){
//        guard reload == true else {
//            locationManager.stopUpdatingLocation()
//            return
//        }
//        
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager.requestWhenInUseAuthorization()
//            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.distanceFilter = 100
//            locationManager.delegate = self
//            locationManager.startUpdatingLocation()
//        }
//
//    }
//}

//extension UserManager: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        debugPrint("Update location")
//        
//        self.currentLocation.value = locations.first?.coordinate
//        self.locationManager.stopUpdatingLocation()
//        
//    }
//    
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        debugPrint("Error \(error)")
//    }
//    
//}

