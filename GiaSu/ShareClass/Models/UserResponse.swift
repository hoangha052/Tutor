//
//  UserResponse.swift
//  GiaSu
//
//  Created by hoangha052 on 4/15/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import ObjectMapper

class UserResponse: Mappable {
    var code: Int?
    var message: String?
    var status: Bool?
    var data: User?
    
    var success   : Bool?
    var terms     : String?
    var privacy   : String?
    var timestamp : CGFloat?
    var source    : String?
//    var quotes    : [Quote]?
    
    required init?(map: Map) { }
    
    func mapping(map: Map) {
        
        self.status <- map["status"]
        self.code <- map["code"]
        self.message <- map["message"]
        self.data <- map["data"]
        
//        success    <- map["success"]
//        terms      <- map["terms"]
//        privacy    <- map["privacy"]
//        timestamp  <- map["timestamp"]
//        source     <- map["source"]
        
//        var dictionary: [String: CGFloat]?
//        dictionary <- map["quotes"]
//        quotes = dictionary?.map { return Quote(name: $0.key, val: $0.value) }
    }
    
    init(httpError: NSError) {
        self.code = httpError.code
        self.message = httpError.localizedDescription
        self.data = nil
    }
    
    func error() -> NSError {
        return NSError(domain: "autospy", code: code ?? 1, userInfo: ["message" : message ?? "Unknown"])
    }
    
    func noError() -> Bool {
        return code == 0
    }
    
    class Quote {
        
        var name : String?
        var val : CGFloat?
        
        init(name: String?, val: CGFloat?) {
            self.name = name
            self.val  = val
        }
        
    }

}
