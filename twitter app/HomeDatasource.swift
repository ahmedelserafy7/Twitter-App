//
//  HomeDatasource.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/21/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import LBTAComponents
import SwiftyJSON

class HomeDatasource: Datasource {
    
    //provide FooterClasses, return what you doing in the cell
    // Why [] array not class, coz collectionView has more than one section, and every time you can need different type of cell, either header or footer that has items inside it different than any of another cell
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    let users: [User]
    let tweets: [Tweet]
    required init(json: JSON) throws {
        
        // if url(https://api.letsbuildthatapp.com/twitter/home_with_error) is not compatible/difference with original(https://api.letsbuildthatapp.com/twitter/home) expectable url which users indicate for users array return error describtion like that
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            // any domain to describe, code number is arbitrary value, NSLocalizedDescriptionKey is a descriptable expression/ statement
            throw NSError(domain: "com.elserafy", code: 1, userInfo: [NSLocalizedDescriptionKey: "users not valid in json"])
        }
        
        self.users = userJsonArray.map{ User(json: $0) }
        self.tweets = tweetJsonArray.map{ Tweet(json: $0) }
    }
    
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
    // returns array of data source cells... this func used to render out each section
    override func cellClasses() -> [DatasourceCell.Type] {
        return [userCell.self, tweetCell.self]
    }
}

