//
//  Project.swift
//  GiaSu
//
//  Created by hoangha052 on 5/23/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Gloss

class Project: NSObject, Decodable {
    var projectId: Int?
    var subject: String?
    var levels: [Project]?
    var selected : Bool = false
    required init?(json: JSON) {
        self.projectId = "id" <~~ json
        self.subject = "subject" <~~ json
        self.levels = "levels" <~~ json
    }
}
