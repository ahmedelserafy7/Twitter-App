//
//  User.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/22/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    var name: String
    var username: String
    var bio: String
    var profileImageUrl: String
    
   init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bio = json["bio"].stringValue
        self.profileImageUrl = json["profileImageUrl"].stringValue
    }
}
