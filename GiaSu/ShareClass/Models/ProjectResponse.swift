//
//  ProjectResponse.swift
//  GiaSu
//
//  Created by hoangha052 on 5/23/17.
//  Copyright © 2017 hoangha052. All rights reserved.
//

import UIKit
import Gloss

class ProjectResponse: BaseResponse {

    var data: [Project]?
    
    required init?(json: JSON) {
        super.init(json: json)
        self.data = "Data" <~~ json
    }
    
}
