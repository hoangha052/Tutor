//
//  UserManager.swift
//  WeTrade
//
//  Created by hoangha052 on 2/27/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit
import Foundation


class UserManager: NSObject {
    
    static let sharedInstance = UserManager()
    var loggedInUser: User?
    
    override init() {
        super.init()
    }
    
    func savePinCode(key: String, pinCode: String){
        UserDefaults.standard.set(pinCode, forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func getPinCode(key: String) -> String?{
        guard let value = UserDefaults.standard.object(forKey: key) as? String else {
            return nil
        }
        return value
    }
    
    func saveUser(_ user: User) {
        self.loggedInUser = nil
        let prefs = UserDefaults.standard
        let encodedUserData = NSKeyedArchiver.archivedData(withRootObject: user)
        prefs.set(encodedUserData, forKey: "User")
        prefs.synchronize()
    }
    
    func getUser() -> User? {
        guard loggedInUser == nil else {
            return loggedInUser
        }
        
        let prefs = UserDefaults.standard
        if let encodedUserData = prefs.object(forKey: "User") as? Data {
            loggedInUser = NSKeyedUnarchiver.unarchiveObject(with: encodedUserData) as? User
        }
        return loggedInUser
    }
    
    func removeSavedUser(){
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "User")
        userDefault.synchronize()
        
        loggedInUser = nil
    }
    
//    func getUserID() -> String{
//        let userInfo = getUser()
//        guard let userID = userInfo?.id else {
//            return ""
//        }
//        
//        return "\(userID)"
//    }
//    
//    func isUserLoggedIn() -> Bool{
//        let userInfo = getUser()
//        return userInfo?.isLogin ?? false
//    }
//    
//    class func subscribeTopicForPushNotification(_ user: User) {
//        //        if let clientKey = user.clientKey {
//        //            FIRMessaging.messaging().subscribe(toTopic: "/topics/\(clientKey)")
//        //        }
//    }
//    
//    func stateUser(isLogin: Bool) {
//        if let userInfo = getUser(){
//            userInfo.isLogin = isLogin
//            saveUser(userInfo)
//        }
//    }
}
