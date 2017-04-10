//
//  AuthNetworkProvider.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import RxSwift
import Gloss
//import FirebaseInstanceID

class AuthNetworkProvider {
//    
//    func registerWithFacebookToken(_ token: String, email: String) -> Observable<AuthResponse?> {
//        let registerFacebookUrl = TinryAPI.User.register.urlString()
//        let bodyParams: [String: AnyObject] = ["FBAccessToken": token as AnyObject,
//                                               "Email": email as AnyObject,
//                                               "UserRoleId": 1 as AnyObject]
//        return NetworkProvider().post(registerFacebookUrl, params: bodyParams).map {
//            response in
//            if let validresponse = response as? JSON {
//                return AuthResponse(json: validresponse)
//            }
//            return nil
//        }
//    }
//    
//    func loginWithFacebookToken(_ token: String) -> Observable<AuthResponse?> {
//        let loginFacebookUrl = TinryAPI.User.loginFacebook.urlString()
//        let bodyParams: [String: AnyObject] = ["FBAccessToken": token as AnyObject]
//        return NetworkProvider().post(loginFacebookUrl, params: bodyParams).map { response in
//            if let validResponse = response as? JSON {
//                return AuthResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updateDeviceTokens(_ token: (oldToken: String?, newToken: String), userId: Int) -> Observable<NetworkResponse?> {
//        let updateDeviceTokensUrl = TinryAPI.User.updateTokens.urlString()
//        var bodyParams: [String: AnyObject] = ["UserId": userId as AnyObject,
//                                               "Token": token.newToken as AnyObject]
//        if let validOldToken = token.oldToken {
//            bodyParams["OldToken"] = validOldToken as AnyObject
//        }
//        
//        return NetworkProvider().post(updateDeviceTokensUrl, params: bodyParams).map { response in
//            if let validResponse = response as? JSON {
//                return NetworkResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updateCurrency(_ currency: String) -> Observable<NetworkResponse?> {
//        let updateCurrencyUrl = TinryAPI.User.updateCurrency.urlString()
//        let user = UserManager.sharedInstance.savedUser()
//        let bodyParams: [String: AnyObject] = ["Currency": currency as AnyObject,
//                                               "Id": (user?.userId)! as AnyObject]
//        return NetworkProvider().post(updateCurrencyUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return NetworkResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updateNotificationSetting(_ userSetting: UserSetting) -> Observable<NetworkResponse?> {
//        let updateNotificationSettingUrl = TinryAPI.User.updateCurrency.urlString()
//        let user = UserManager.sharedInstance.savedUser()
//        let bodyParams: [String: AnyObject] = ["Messages": userSetting.messageNotification! as AnyObject,
//                                               "Reservations": userSetting.reservationNotification! as AnyObject,
//                                               "TinryUpdates": userSetting.tinryUpdateNotification! as AnyObject,
//                                               "Id": (user?.userId)! as AnyObject]
//        return NetworkProvider().post(updateNotificationSettingUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return NetworkResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func updatePayoutInfor(_ email: String) -> Observable<NetworkResponse?> {
//        let user = UserManager.sharedInstance.savedUser()
//        let updateCurrencyUrl = TinryAPI.User.updatePayoutInfo.urlString()
//       
//        let bodyParams: [String: AnyObject] = ["Email": email as AnyObject,
//                                               "UserId": user?.userId! as AnyObject]
//        return NetworkProvider().post(updateCurrencyUrl, params: bodyParams).map {
//            response in
//            if let validResponse = response as? JSON {
//                return NetworkResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func submitFeedback(feedback: [String: AnyObject]) -> Observable<NetworkResponse?> {
//        let feedbackUrl = TinryAPI.User.feedback.urlString()
//        
//        return NetworkProvider().post(feedbackUrl, params: feedback).map {
//            response in
//            if let validResponse = response as? JSON {
//                return NetworkResponse(json: validResponse)
//            }
//            return nil
//        }
//    }
//    
//    func loadTransactionHistory(_ index: Int) -> Observable<TransactionResponse?> {
//        let user = UserManager.sharedInstance.savedUser()
//        
//        var transactionHistoryURL = TinryAPI.User.getTourisTransactionHistory((user?.userId!)!, index, 25).urlString()
//        if user?.userRoleId == 2 {
//            transactionHistoryURL = TinryAPI.User.getProviderTransactionHistory((user?.userId!)!, index, 25).urlString()
//        }
//        return NetworkProvider().get(transactionHistoryURL, params: nil).map {
//            response in
//            if let validResponse = response as? JSON {
//                return TransactionResponse(json: validResponse)
//            }
//            return nil
//        }
//    }

}
