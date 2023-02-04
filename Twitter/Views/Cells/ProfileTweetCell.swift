//
//  ProfileTweetCell.swift
//  Twitter
//
//  Created by Kabir Dhillon on 2/3/23.
//  Copyright © 2023 Dan. All rights reserved.
//

import UIKit

class ProfileTweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
