//
//  HomeDatasource.swift
//  twitter app
//
//  Created by Ahmed.S.Elserafy on 9/21/17.
//  Copyright © 2017 Ahmed.S.Elserafy. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

extension Collection where Iterator.Element == JSON{
    
    func decode<T: JSONDecodable>()throws -> [T] {
        return try map({try T(json: $0)})
    }
}

class HomeDatasource: Datasource, JSONDecodable {
    
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
        
        //print("Ready to parse json: \n", json)
        //print(json["users"])
//        var users = [User]()
        
        // if url(https://api.letsbuildthatapp.com/twitter/home_with_error) is not compatible/difference with original(https://api.letsbuildthatapp.com/twitter/home) expectable url which users indicate for users array return error describtionlike that
        guard let userJsonArray = json["users"].array, let tweetJsonArray = json["tweets"].array else {
            // any domain to describe, code number is arbitrary value, NSLocalizedDescriptionKey is a descriptable expression/ statement
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "users not valid in json"])
        }
//        self.users = userJsonArray!.map({ return User(json: $0)})
//       self.users = userJsonArray.map{ User(json: $0)}
//       self.tweets = tweetJsonArray.map{return Tweet(json: $0)}
        
        self.users = try userJsonArray.decode()
        self.tweets = try tweetJsonArray.decode()
        
        
/*
        for userjson in userJsonArray! {
            print(userjson["name"].stringValue)
//            let name = userjson["name"].stringValue
//            let username = userjson["username"].stringValue
//            let bio = userjson["bio"].stringValue
//            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            let user = User(json: userjson)
            users.append(user)
        }
 */

//        var tweets = [Tweet]()
/*
        guard let tweetJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp.api", code: 1, userInfo: [NSLocalizedDescriptionKey: "tweets not valid in json"])
        }
 */
//        self.tweets = tweetJsonArray!.map({ return Tweet(json: $0)})
        // simple way ... summarized way
        
 /*
        for tweetJson in tweetJsonArray.array! {
//            let userJson = tweetJson["user"]
//            let name = userJson["name"].stringValue
//            let username = userJson["username"].stringValue
//            let bio = userJson["bio"].stringValue
//            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
         //   let user = User(json: userJson)
         //   let message = tweetJson["message"].stringValue
//       let tweet = Tweet(user: user, message: message)
            let tweet = Tweet(json: tweetJson)
            tweets.append(tweet)
        }
        */
        // to tell the item and number of item func about what are "users"?
//        self.users = users
//        self.tweets = tweets
    }
    
    
    //    let words = ["user1", "user2", "user3"]
   
   /* let users: [User] = {
        let ahmedUser = User(name: "Ahmed Elserafy", username: "@AhmedElserafy11", bioText: "Hey there!, it'me \("Ahmed Samir"), 22 yr, and an iOS Programming aficionado.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let rayUser = User(name: "Ray Wenderlich", username: "@rwenderlich", bioText: "Ray Wenderlich is an iPhone and tweets on topic related to iPhone, software, and gaming. Check out our conference.", profileImage: #imageLiteral(resourceName: "ray_profile_image"))
//        let steveUser = User(name: "Steve Jobs", username: "iSteve_jobs", bioText: "Apple CEO, Most people make the mistake of thinking design is what it looks like.\n" + "People think it’s this veneer.\n" + "It’s not just what it looks like and feels like." + "\nDesign is how it works.", profileImage: #imageLiteral(resourceName: "steve_profile"))
        let brianUser = User(name: "Brian Voong", username: "@buildthatapp", bioText: "iPhone, iPad, iOS Programming Community. Join us to learn Swift, Objective-C and build iOS apps!", profileImage: #imageLiteral(resourceName: "brian_voong"))
        return [ahmedUser, rayUser, brianUser]
    }()*/
//        , "user4", "user5"]
 

     /*
        = {
         let ahmedUser = User(name: "Ahmed Elserafy", username: "@AhmedElserafy11", bioText: "Hey there!, it'me \("Ahmed Samir"), 22 yr, and an iOS Programming aficionado.", profileImage: #imageLiteral(resourceName: "profile_image"))
        let tweet = Tweet(user: ahmedUser, message: "Hello from the other side, I'm just tweeted the first tweet. Very exciting...")
        
         let steveUser = User(name: "Steve Jobs", username: "@iSteve_jobs", bioText: "Apple CEO, Love Life and Apple, so Apple is life", profileImage: #imageLiteral(resourceName: "steve_profile"))
        let tweet2 = Tweet(user: steveUser, message: "Most people make the mistake of thinking design is what it looks like.\n" + "People think it’s this veneer.\n" + "It’s not just what it looks like and feels like." + "\nDesign is how it works.")
        return [tweet, tweet2]
    }()
    */
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

