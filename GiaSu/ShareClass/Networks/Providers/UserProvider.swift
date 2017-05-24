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
    
    func addFavoriteUser(favUserId: Int, completionHandler: @escaping(UserResponse?) -> ())  {
        let userData = UserManager.sharedInstance.getUser()
        let addFavoriteUrl = GiaSuAPI.User.addUserFavorite(15, 10).urlString()
        
        NetworkProvider().get(addFavoriteUrl, params:nil) { (responseObject, error) in
            if let response = responseObject as? JSON {
                let user = UserResponse.init(json: response)
                completionHandler(user)
            }
        }
    }
    
    func removeFavoriteUser(favUserId: Int, completionHandler: @escaping(UserResponse?) -> ())  {
        let userData = UserManager.sharedInstance.getUser()
        let removeFavoriteUrl = GiaSuAPI.User.removeUserFavorite(15, 10).urlString()
        
        NetworkProvider().get(removeFavoriteUrl, params:nil) { (responseObject, error) in
            if let response = responseObject as? JSON {
                let user = UserResponse.init(json: response)
                completionHandler(user)
            }
        }
    }
    
    func getListFavoriteUser(_ completionHandler: @escaping(UserResponse?) -> ())  {
        let userData = UserManager.sharedInstance.getUser()
        let listFavoriteUrl = GiaSuAPI.User.getListFavoriteUser(15).urlString()
        
        NetworkProvider().get(listFavoriteUrl, params:nil) { (responseObject, error) in
            if let response = responseObject as? JSON {
                let user = UserResponse.init(listUserJson: response)
                completionHandler(user)
            }
        }
    }
    
    func getListProject(completionHandler: @escaping(ProjectResponse?) -> ())  {
        let getAllUserURL = GiaSuAPI.User.getListSubject().urlString()
        NetworkProvider().get(getAllUserURL, params: nil) { (responseObject, error) in
            let project: ProjectResponse?
            if let response = responseObject as? JSON {
                project = ProjectResponse.init(json: response)
                completionHandler(project)
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
