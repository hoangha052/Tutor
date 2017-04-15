//
//  UserProvider.swift
//  Tinry
//
//  Created by hoangha052 on 9/21/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import ObjectMapper
//import Gloss
//import RxSwift

class UserProvider {    
    func getAllUser(completionHandler: @escaping(UserResponse?) -> ())  {
            let insertTripProfileUrl = TinryAPI.Tinry.insertTripProfile.urlString()
            NetworkProvider().put(insertTripProfileUrl, params: nil) { (responseObject, error) in
                let user: UserResponse?
                if let response = responseObject {
                    user = UserResponse.init(map: Map.init(mappingType: .fromJSON, JSON: response as! [String : Any]))
                } else {
                    user = UserResponse.init(httpError: error!)
                }
            completionHandler(user)
        }
    }
    
}
