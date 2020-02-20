//
//  Service.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 10/7/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import Foundation
import LBTAComponents
import SwiftyJSON

struct Service {
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion:@escaping (HomeDatasource?, Error?)->()) {
        
        let urlString = "https://api.letsbuildthatapp.com/twitter/home"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do {
                let json = try JSON(data: data)
                 let homeDatasource = try HomeDatasource(json: json)
                
                    completion(homeDatasource, nil)
                
            } catch let err {
                print(err)
            }
        }.resume()
    } 
}


