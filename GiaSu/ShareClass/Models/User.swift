//
//  User.swift
//  Bartr
//
//  Created by Thuy Luong on 5/23/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Gloss

final class User: NSObject, Decodable {
    var userId: Int?
    var username: String?
    var clientKey: String?
    var accessToken: String?
    var email: String?
    var phone: String?
    var avatar: String?
    var userRoleId: Int?
    var isActive: Bool?
    var name: String?
    var paypalEmail: String?
    var descriptionStr: String?
    
    
    init?(json: JSON) {
        self.userId = "Id" <~~ json
        self.username = "Username" <~~ json
        self.clientKey = "ClientKey" <~~ json
        self.accessToken = "AccessToken" <~~ json
        self.email = "Email" <~~ json
        self.phone = "Phone" <~~ json
        self.userRoleId = "userrole" <~~ json
        self.isActive = "Active" <~~ json
        self.name = "Name" <~~ json
        self.avatar = "Link" <~~ json
        self.descriptionStr = "description" <~~ json
    }
    
    init(userId: Int) {
        self.userId =  userId
    }
    
    init?(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObject(forKey: "UserId") as? Int
        self.username = aDecoder.decodeObject(forKey: "Username") as? String
        self.clientKey = aDecoder.decodeObject(forKey: "ClientKey") as? String
        self.accessToken = aDecoder.decodeObject(forKey: "AccessToken") as? String
        self.email = aDecoder.decodeObject(forKey: "Email") as? String
        self.userRoleId = aDecoder.decodeObject(forKey: "UserRoleId") as? Int
        self.isActive = aDecoder.decodeBool(forKey: "IsActive")
        self.avatar = aDecoder.decodeObject(forKey: "Link") as? String
        self.name = aDecoder.decodeObject(forKey: "Name") as? String
        self.paypalEmail = aDecoder.decodeObject(forKey: "PaypalEmail") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userId, forKey: "UserId")
        aCoder.encode(self.username, forKey: "Username")
        aCoder.encode(self.clientKey, forKey: "ClientKey")
        aCoder.encode(self.accessToken, forKey: "AccessToken")
        aCoder.encode(self.email, forKey: "Email")
        aCoder.encode(self.userRoleId, forKey: "UserRoleId")
        aCoder.encode(self.isActive!, forKey: "IsActive")
        aCoder.encode(self.avatar, forKey: "Link")
        aCoder.encode(self.name, forKey: "Name")
        aCoder.encode(self.paypalEmail, forKey: "PaypalEmail")
    }
}
