//
//  TweetViewController.swift
//  Twitter
//
//  Created by Kabir Dhillon on 12/17/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tweetTextView.delegate = self
        tweetTextView.becomeFirstResponder()
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    @IBOutlet weak var countLabel: UILabel!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if(!tweetTextView.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetTextView.text, success: {
                self.dismiss(animated: true, completion: nil)
            }, failure: { (error) in
                print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)
            })
        } else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}

extension ComposeTweetViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // TODO: Check the proposed new text character count
        // Allow or disallow the new text
        
        // Set the max character limit
        let characterLimit = 280
        
        // Construct what the new text would be if we allowed the user's latest edit
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        // TODO: Update Character Count Label
        let charCount: Int = {
            characterLimit - textView.text.count
        }()
        
        countLabel.text = "\(charCount)"

        // The new text should be allowed? True/False
        return newText.count < characterLimit
    }
}
