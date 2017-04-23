//
//  NetworkConfigurations.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

enum GiaSuAPI {
        
    private static let properBaseURL = "http://serapi.azurewebsites.net/api/"
    private static let stagingImageBaseUrl = "http://5.9.155.139:32138"
    
    private static let productionBaseURL = "http://5.9.155.139:32138/api/"
    private static let productionImageBaseUrl = "http://5.9.155.139:32138"
    
//    static var properBaseURL: String = {
//        let isStagingVersion = Bundle.main.bundleIdentifier?.contains("staging")
//        return isStagingVersion == true ? stagingBaseURL : productionBaseURL
//    }()
//    
//    static var properImageBaseUrl: String = {
//        let isStagingVersion = Bundle.main.bundleIdentifier?.contains("staging")
//        return isStagingVersion == true ? stagingImageBaseUrl : productionImageBaseUrl
//    }()
    
    enum User {
        case getEmail
        case getRecomendations
        case login
        case register
        case getListUser(Int, Int, Int)
        case updateCurrency
        case updateNotificationSetting
        case updatePayoutInfo
        case getTourisTransactionHistory(Int, Int, Int)
        case getProviderTransactionHistory (Int, Int, Int)
        case feedback
        
        fileprivate func apiPath() -> String {
            switch self {
            case .getEmail:
                return "user/get_user_by_email"
            case .getRecomendations:
                return "user/get_recommendations"
            case .login:
                return "user/userLogin"
            case .register:
                return "/user/register"
            case .getListUser(let userId, let roleId, let pageSize):
                return "User/getUserList/\(userId)/\(roleId)/\(pageSize)"
            case .updateCurrency:
                return "/user/update_user_setting"
            case .updateNotificationSetting:
                return "/user/update_user_notification"
            case .updatePayoutInfo:
                return "/payment/insert_payout_method"
            case .getTourisTransactionHistory(let userId, let offset, let pageSize):
                return "/transactions/get_transactions_for_tourist/\(userId)/\(offset)/\(pageSize)"
            case .getProviderTransactionHistory(let userId, let offset, let pageSize):
                return "/transactions/get_transactions_for_provider/\(userId)/\(offset)/\(pageSize)"
            case .feedback:
                return "/user/send_feedback"
            
            }
        }
        
        func urlString() -> String {
            return GiaSuAPI.properBaseURL + apiPath()
        }
    }
    
    
    
}
