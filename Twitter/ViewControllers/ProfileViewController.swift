//
//  ProfileViewController.swift
//  Twitter
//
//  Created by Kabir Dhillon on 1/26/23.
//  Copyright © 2023 Dan. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {
    
    var profileViewModel: ProfileViewModel!
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var userTweetsTableView: UITableView!
    
    var currentUser: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bind to HomeVM
//        profileViewModel = ProfileViewModel()
//        profileViewModel.bindProfileViewModelToController = { [weak self] in
//            guard let strongSelf = self, let user = strongSelf.profileViewModel.currentUser else {
//                return
//            }
//
//            strongSelf.usernameLabel.text = user.username
//            strongSelf.profileImageView.af_setImage(withURL: user.profileImageUrl)
//            strongSelf.nameLabel.text = user.name
//
//            strongSelf.userTweetsTableView.reloadData()
//        }
//
//        userTweetsTableView.delegate = self
//        userTweetsTableView.dataSource = self
        getProfileInfo()
        
    }
    
    func getProfileInfo() {
        TwitterAPICaller.client?.getCurrentUser(success: { user in
            self.currentUser = user
            
            self.profileImageView.af_setImage(withURL: self.currentUser.profileImageUrl)
            self.usernameLabel.text = self.currentUser.username
            self.nameLabel.text = self.currentUser.name
        }, failure: { error in
            print(error.localizedDescription)
        })
    }
}

//extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return profileViewModel.currentUserTweets.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "profileTweetCell", for: indexPath) as! ProfileTweetCell
//
//        print("Profile cell: \(cell)")
//
//        let tweet = profileViewModel.currentUserTweets[indexPath.row]
//
//        cell.profileImageView.af_setImage(withURL: tweet.user.profileImageUrl)
//        cell.profileImageView.layer.borderWidth = 0
//        cell.profileImageView.layer.masksToBounds = false
//        cell.profileImageView.layer.cornerRadius = cell.profileImageView.frame.height/2
//        cell.profileImageView.clipsToBounds = true
//
//        cell.usernameLabel.text = tweet.user.name
//        cell.tweetLabel.text = tweet.content
//
//        return cell
//    }
//}
