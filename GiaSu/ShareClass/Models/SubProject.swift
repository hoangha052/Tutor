//
//  SubProject.swift
//  GiaSu
//
//  Created by hoangha052 on 5/23/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Gloss

class SubProject: NSObject, Decodable{

    var levelId: Int?
    var level: String?
    
    required init?(json: JSON) {
        self.levelId = "LevelID" <~~ json
        self.level = "level" <~~ json
    }
}
