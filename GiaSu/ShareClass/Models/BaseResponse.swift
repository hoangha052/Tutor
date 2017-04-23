//
//  BaseResponse.swift
//  GiaSu
//
//  Created by hoangha052 on 4/22/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Gloss

class BaseResponse: NSObject, Decodable {
    
    var code: Int?
    var message: String?
    var status: Bool?
    
    required init?(json: JSON) {
//        self.status = "StatusCode" <~~ json
        self.code = "StatusCode" <~~ json
        self.message = "Message" <~~ json
    }
    
    
     func initWithError(httpError: NSError) {
        self.code = httpError.code
        self.message = httpError.localizedDescription
    }
    
    func error() -> NSError {
        return NSError(domain: "autospy", code: code ?? 1, userInfo: ["message" : message ?? "Unknown"])
    }
    
    func noError() -> Bool {
        return code == 0
    }
}
