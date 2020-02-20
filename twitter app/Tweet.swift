//
//  Tweet.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/29/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    var user: User
    var message: String

    init(json: JSON) {
        
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
    
}
