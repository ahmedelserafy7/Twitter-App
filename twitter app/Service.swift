//
//  Service.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 10/7/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion:@escaping (HomeDatasource?, Error?)->()) {
        
//        print("Done Fetching home Feed")
    
        // reach out the internet, after a second or two, it finishes the network call 
       let request: APIRequest <HomeDatasource,JSONError> = tron.request("twitter/home")
        request.perform(withSuccess: { (homeDatasource) in
          
//            print("Successfully parse json")
            
            completion(homeDatasource, nil)
            
        }) { (err) in
            completion(nil, err)
//            print("failed to parse json", err)
        }
    } 
}

class JSONError: JSONDecodable {
    
    required init(json: JSON) throws {
        print("JSONError")
    }
}

