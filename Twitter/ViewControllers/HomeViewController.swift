//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Kabir Dhillon on 12/9/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class HomeViewController: UITableViewController {
    
    var vm = HomeViewModel()
    
    //var tweetArray = [Tweet]()
    var numberOfTweets: Int!
    
    let myRefreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind to HomeVM
        vm = HomeViewModel()
        vm.bindHomeViewModelToController = { [weak self] in
            guard let strongSelf = self else {
                return
            }
            strongSelf.tableView.reloadData()
        }
        loadTweets()
        
        myRefreshControl.addTarget(self, action: #selector(loadTweets), for: .valueChanged)
        self.tableView.refreshControl = myRefreshControl
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 150
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loadTweets()
    }
    
    @objc func loadTweets(){
        numberOfTweets = 20
        
        vm.fetchTweets(numberOfTweets: numberOfTweets) {
            self.tableView.reloadData()
            self.myRefreshControl.endRefreshing()
        }
    }
    
    func loadMoreTweets(){
        numberOfTweets = numberOfTweets + 20
        vm.updateTweets(numberOfTweets: numberOfTweets) {
            self.tableView.reloadData()
        }
    }
    
    @IBAction func onLogout(_ sender: Any) {
        TwitterAPICaller.client?.logout()
        self.dismiss(animated: true, completion: nil)
        
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row + 1 == vm.tweets.count {
                loadMoreTweets()
            }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        
        let tweet = vm.tweets[indexPath.row]
        //let user = tweetArray[indexPath.row]["user"] as! NSDictionary
        
        cell.userNameLabel.text = tweet.user.name
        cell.tweetContent.text = tweet.content
        
        //let url = URL(string: (user["profile_image_url_https"] as? String)!)
        //if let imageUrl = url {
        cell.profileImageView.af_setImage(withURL: tweet.user.profileImageUrl)
        //}
        
        cell.tweetId = tweet.id
        cell.setfavorite(isFavorited: tweet.favorited)
        cell.setRetweeted(isRetweeted: tweet.retweeted)
        
        return cell
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vm.tweets.count
    }
}
