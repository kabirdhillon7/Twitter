//
//  ProfileViewModel.swift
//  Twitter
//
//  Created by Kabir Dhillon on 2/3/23.
//  Copyright © 2023 Dan. All rights reserved.
//

import Foundation

class ProfileViewModel {
    
    var currentUserTweets = [Tweet]() {
        didSet{
            self.bindProfileViewModelToController()
        }
    }
    var currentUser: User! {
        didSet{
            self.bindProfileViewModelToController()
        }
    }
    
    var bindProfileViewModelToController: (() -> ()) = {}
    
    // get user info
    func getCurrentUser(success: @escaping (User) -> (), failure: @escaping (Error) -> ()) {
        TwitterAPICaller.client?.getCurrentUser(success: { user in
            print(user)
            self.currentUser = user
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
    
    func getCurrentUserTweets() {
        TwitterAPICaller.client?.get("https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: ["screen_name": "current_user_screen_name"], progress: nil, success: { (task: URLSessionDataTask, response: Any?) in
            let responseDictionaries = response as! [NSDictionary]
            
            guard let currentUser = self.currentUser else {
                return
            }
            for dictionary in responseDictionaries {
                let tweet = Tweet(id: dictionary["id"] as! Int,
                                  content: dictionary["text"] as! String,
                                  user: currentUser,
                                  favoriteCount: dictionary["favorite_count"] as! Int,
                                  retweetCount: dictionary["retweet_count"] as! Int,
                                  favorited: dictionary["favorited"] as! Bool,
                                  retweeted: dictionary["retweeted"] as! Bool)
                print("User tweet: \(tweet)")
                self.currentUserTweets.append(tweet)
            }
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            print(error.localizedDescription)
        })
    }
}
