//
//  UserResponse.swift
//  GiaSu
//
//  Created by hoangha052 on 4/15/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Gloss

class UserResponse: BaseResponse {
    var data: [User]?
    var userData: User?
    
    required init?(json: JSON) {
        super.init(json: json)
        self.userData = "Data" <~~ json
    }
    
    init?(listUserJson: JSON) {
        super.init(json: listUserJson)
        self.data = "Data" <~~ listUserJson
    }
//    init(httpError: NSError) {
//        self.code = httpError.code
//        self.message = httpError.localizedDescription
//        self.data = nil
//    }
//    
//    func error() -> NSError {
//        return NSError(domain: "autospy", code: code ?? 1, userInfo: ["message" : message ?? "Unknown"])
//    }
//    
//    func noError() -> Bool {
//        return code == 0
//    }
    
    class Quote {
        
        var name : String?
        var val : CGFloat?
        
        init(name: String?, val: CGFloat?) {
            self.name = name
            self.val  = val
        }
        
    }

}
