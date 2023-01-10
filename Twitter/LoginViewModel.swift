//
//  LoginViewModel.swift
//  Twitter
//
//  Created by Kabir Dhillon on 7/8/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class LoginViewModel: NSObject {
    
    @IBAction func onLoginButton(_ sender: Any) {
        print("Login Button pressed")
        
        let myURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: myURL, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
        }, failure: { (Error) in
            print("Could not login")
        })
    }
}
