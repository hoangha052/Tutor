//
//  UserProvider.swift
//  Tinry
//
//  Created by hoangha052 on 9/21/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
//import ObjectMapper
//import AlamofireObjectMapper
import Alamofire
import Gloss
//import RxSwift

class UserProvider {    
    func getAllUser(completionHandler: @escaping(UserResponse?) -> ())  {
            let getAllUserURL = GiaSuAPI.User.getListUser(15, 1, 10).urlString()
            NetworkProvider().get(getAllUserURL, params: nil) { (responseObject, error) in
                let user: UserResponse?
                if let response = responseObject as? JSON {
                    user = UserResponse.init(listUserJson: response)
                    completionHandler(user)
                }
        }
    }
//
//    func getUserDetail(completionHandler: @escaping(UserResponse?) -> ())  {
//        let insertTripProfileUrl = TinryAPI.User.insertTripProfile.urlString()
//        NetworkProvider().put(insertTripProfileUrl, params: nil) { (responseObject, error) in
//            let user: UserResponse?
//            if let response = responseObject {
//                user = UserResponse.init(map: Map.init(mappingType: .fromJSON, JSON: response as! [String : Any]))
//            } else {
//                user = UserResponse.init(httpError: error!)
//            }
//            completionHandler(user)
//        }
//    }
    
    func userLogin(userName: String, password: String, completionHandler: @escaping(UserResponse?) -> ())  {
        let loginUrl = GiaSuAPI.User.login.urlString()
        let params = ["username" : userName, "password" : password, "UserRole": 1] as [String : Any]
        
        NetworkProvider().post(loginUrl, params: params as [String : AnyObject]?) { (responseObject, error) in
            
            if let response = responseObject as? JSON {
                let user = UserResponse.init(json: response)
                completionHandler(user)
            }
        }
    }
    
    
//    static func addSoccerQuestion(match: String, callback: @escaping (_ result: UserResponse?)->()){
//        
//        
//        let URL = "fsdf"
//        print(URL)
//        
//        Alamofire.request(URL, method: .post, parameters: nil, headers: nil).responseObject { (response: DataResponse<UserResponse>) in
//            callback(response.result.value)
//        }
//    }
}
