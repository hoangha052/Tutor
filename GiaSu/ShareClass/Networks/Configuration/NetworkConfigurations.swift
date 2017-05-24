//
//  NetworkConfigurations.swift
//  Bartr
//
//  Created by Thuy Luong on 5/22/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation

enum GiaSuAPI {
        
    private static let properBaseURL = "http://ec2-13-58-134-132.us-east-2.compute.amazonaws.com:2269/api/"
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
        case login
        case register
        case getListUser(Int, Int, Int)
        case addUserFavorite(Int, Int)
        case removeUserFavorite(Int, Int)
        case getListFavoriteUser(Int)
        case getListSubject()
        
        fileprivate func apiPath() -> String {
            switch self {
            case .login:
                return "user/userLogin"
            case .register:
                return "User/register"
            case .getListUser(let userId, let roleId, let pageSize):
                return "User/getUserList/\(userId)/\(roleId)/\(pageSize)"
            case .addUserFavorite(let currentUserId, let favUserId):
                return "User/addFavUser/\(currentUserId)/\(favUserId)"
            case .removeUserFavorite(let currentUserId, let favUserId):
                return "User/removeFavUser/\(currentUserId)/\(favUserId)"
            case .getListFavoriteUser(let userId):
                return "User/getFavUsers/\(userId)"
            case .getListSubject():
                return "subject/getSubjectLevel"
            }
        }
        
        func urlString() -> String {
            return GiaSuAPI.properBaseURL + apiPath()
        }
    }
    
}
