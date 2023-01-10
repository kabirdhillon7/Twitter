//
//  Tweet.swift
//  Twitter
//
//  Created by Kabir Dhillon on 1/9/23.
//  Copyright © 2023 Dan. All rights reserved.
//

import Foundation

struct Tweet {
    
    let id: Int
    let content: String
    let user: User
    
    let favoriteCount: Int
    let retweetCount: Int
    
    let favorited: Bool
    let retweeted: Bool
    
    init(id: Int, content: String, user: User, favoriteCount: Int, retweetCount: Int, favorited: Bool, retweeted: Bool) {
        self.id = id
        self.content = content
        self.user = user
        self.favoriteCount = favoriteCount
        self.retweetCount = retweetCount
        self.favorited = favorited
        self.retweeted = retweeted
    }
}

struct User {
    let name: String
    let username: String
    let profileImageUrl: URL
    
    init(name: String, username: String, profileImageUrl: URL) {
        self.name = name
        self.username = username
        self.profileImageUrl = profileImageUrl
    }
}
