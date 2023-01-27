//
//  HomeViewModel.swift
//  Twitter
//
//  Created by Kabir Dhillon on 1/9/23.
//  Copyright © 2023 Dan. All rights reserved.
//

import Foundation
import UIKit

class HomeViewModel: NSObject {
    
    var tweets = [Tweet]() {
        didSet{
            self.bindHomeViewModelToController()
        }
    }
    
    var bindHomeViewModelToController: (() -> ()) = {}
    
    // fetch Tweets
    func fetchTweets(numberOfTweets: Int, completion: @escaping () -> Void) {
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams = ["count": numberOfTweets]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams as [String : Any], success: { (tweets: [Tweet]) in
            self.tweets = tweets
            completion()
            
        }, failure: { (error) in
            print(error.localizedDescription)
        })
        
    }
    
    // update tweetArray
    func updateTweets(numberOfTweets: Int, completion: @escaping () -> Void){
        let myUrl = "https://api.twitter.com/1.1/statuses/home_timeline.json"
        let myParams  = ["count": numberOfTweets + 20]
        
        TwitterAPICaller.client?.getDictionariesRequest(url: myUrl, parameters: myParams as [String : Any], success: { (tweets: [Tweet]) in
            self.tweets.removeAll()
            self.tweets = tweets
            
            completion()
        }, failure: { (error) in
            print(error.localizedDescription)
        })
    }
}
