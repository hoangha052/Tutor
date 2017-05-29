//
//  User.swift
//  Bartr
//
//  Created by Thuy Luong on 5/23/16.
//  Copyright © 2016 Thuy Luong. All rights reserved.
//

import Foundation
import Gloss

final class User: NSObject, Decodable, Encodable, NSCoding {
    var userId: Int?
    var username: String?
    var email: String?
    var phone: String?
    var avatar: String?
    var userRoleId: Int?
    var isActive: Bool?
    var descriptionStr: String?
    var imageProfile: UIImage?
    var password: String?
    var address: String?
    var price: Int?
    var experience: Int?
    var degree: String?
    var school: String?
    
    
//    var clientKey: String?
//    var accessToken: String?
//    var name: String?
//    var paypalEmail: String?

    
    init?(json: JSON) {
        self.userId = "Id" <~~ json
        self.username = "username" <~~ json
        self.userRoleId = "userrole" <~~ json
        self.email = "Email" <~~ json
        self.price = "salary" <~~ json
        self.experience = "experience" <~~ json
        self.degree = "degree" <~~ json
        self.address = "address" <~~ json
        self.phone = "phoneNo" <~~ json
        self.userRoleId = "userrole" <~~ json
        self.descriptionStr = "description" <~~ json
        self.avatar = "avatar" <~~ json
        self.school = "school" <~~ json
    }
    
    init?(coder aDecoder: NSCoder) {
        self.userId = aDecoder.decodeObject(forKey: "UserId") as? Int
        self.username = aDecoder.decodeObject(forKey: "Username") as? String
        self.userRoleId = aDecoder.decodeObject(forKey: "Userrole") as? Int
//        self.email = aDecoder.decodeObject(forKey: "Email") as? String
        self.price = aDecoder.decodeObject(forKey: "Price") as? Int
        self.experience = aDecoder.decodeObject(forKey: "experience") as? Int
        self.degree = aDecoder.decodeObject(forKey: "Degree") as? String
        self.address = aDecoder.decodeObject(forKey: "Address") as? String
        self.phone = aDecoder.decodeObject(forKey: "Phone") as? String
        self.descriptionStr = aDecoder.decodeObject(forKey: "Description") as? String
        self.avatar = aDecoder.decodeObject(forKey: "avatar") as? String
        self.school = aDecoder.decodeObject(forKey: "School") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.userId, forKey: "UserId")
        aCoder.encode(self.username, forKey: "Username")
        aCoder.encode(self.userRoleId, forKey: "Userrole")
//        aCoder.encode(self.email, forKey: "Email")
        aCoder.encode(self.price, forKey: "Price")
        aCoder.encode(self.experience, forKey: "experience")
        aCoder.encode(self.degree, forKey: "Degree")
        aCoder.encode(self.address, forKey: "Address")
        aCoder.encode(self.phone, forKey: "Phone")
        aCoder.encode(self.descriptionStr, forKey: "Description")
        aCoder.encode(self.avatar, forKey: "avatar")
        aCoder.encode(self.school, forKey: "School")
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "username" ~~> self.username,
            "userRole" ~~> self.userRoleId,
            "email" ~~> self.email,
            "passWord" ~~> self.password,
            "salary" ~~> self.price,
            "expericence" ~~> "4",
            "degree" ~~> "Senior",
            "phoneNo" ~~> self.phone,
            "description" ~~> self.descriptionStr,
            "sex" ~~> "1",
            "school" ~~> "HUI University",
            "subjectLevelList" ~~> "1-6",
            "address" ~~> self.address
            ])
    }
    
    init(userId: Int) {
        self.userId =  userId
    }
    
    init(roleId: Int) {
        self.userRoleId = roleId
    }
    

}
