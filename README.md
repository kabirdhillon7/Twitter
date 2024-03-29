# Twitter
Twitter is a basic twitter app to view, compose, favorite, and retweet tweets using the [Twitter API](https://developer.twitter.com/en/docs/twitter-api)

Twitter is in proccess of being designed using the Model-View-ViewModel (MVVM) pattern, which separates the app's data model, user interface, and business logic into distinct components.

## Table of Contents

- [Description](#description)
- [Requirements](#requirements)
- [Demo](#demo)
- [Installation](#installation)
- [Dependencies](#dependencies)
- [Contact](#contact)

## Description

Some of the main features include:

- User can log into their Twitter account, and stay logged in across restarts.
- User can view a tab bar with a home and user profile tab.
- Home Tab
  - User can view tweets with the user profile picture, username, and tweet text
  - User can pull to refresh using a UIRefreshControl, and load tweets infinitely.
  - User can can retweet and favorite tweets
  - User can use navigation bar to logout and compose a tweet with a countdown for the number of characters remaining for the tweet (out of 280)
- Profile Tab
  - User can view their user profile in a profile tab

## Requirements
- iOS 15.0 or later
- iPhone 6s or iPhone SE (1st generation) or newer
- iPod touch 7th generation or newer

## Demo
### Current Progress Walkthrough
<img src='https://user-images.githubusercontent.com/74223402/220224217-f449189e-719e-4944-9d58-766b06336901.gif' width=250><br>

### Progress 2 Walkthrough
<details>
  <summary>Click to view</summary>
  
  <img src='https://github.com/kabirdhillon7/Twitter/blob/main/Walkthrough%202.gif' width=250><br>
</details>

### Progress 1 Walkthrough
<details>
  <summary>Click to view</summary>
  
  <img src='https://github.com/kabirdhillon7/Twitter/blob/main/Walkthrough%201.gif' width=250><br>
</details>

## Installation

To install and set up the app on your own device, follow these steps:

### Prerequisites
- Xcode 11 or later
- CocoaPods (installation instructions can be found at https://cocoapods.org/)

### Cloning the repository

To clone the repository, open a terminal and enter the following command:
```
git clone https://github.com/kabirdhillon7/Twitter
```

### Installing dependencies

To install the dependencies for the app, navigate to the directory where you cloned the repository and run the following command:
```
pod install
```
This will install all of the dependencies specified in the `Podfile`.

Open the `Twitter.xcworkspace` file in Xcode. Make sure that the `Twitter` scheme is selected, and then click the "Run" button to build and run the app.

### Configuration

Before you can use the app, you will need to set up your API keys. To do this, follow these steps:

In order to use the Twitter API, you will need to create a Twitter developer account and obtain your own set of API credentials (a consumer_key and consumer_secret). You can do this by visiting the [Twitter Developer Dashboard](https://developer.twitter.com/en/apps) and creating a new app.

Once you have obtained your API credentials, in Xcode, open the 'TwitterAPICaller.swift' file and replace 'consumerKey' and 'consumerSecret' with the API consumer key and consumer secret you received.

```Swift
class TwitterAPICaller: BDBOAuth1SessionManager {
    static let client = TwitterAPICaller(baseURL: URL(string: "https://api.twitter.com"), consumerKey: TwitterAPI.consumerKey, consumerSecret: TwitterAPI.consumerSecret)
}
```

## Dependencies
  
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) (MIT License)
- [Alamofire](https://github.com/Alamofire/Alamofire) (MIT License)
- [Alamofire Image](https://github.com/Alamofire/AlamofireImage) (MIT License)
- [BDBOAuth1Manager](https://github.com/bdbergeron/BDBOAuth1Manager)

## Contact

If you have any questions or feedback, you can reach me through the following channels:

- GitHub: [@kabirdhillon7](https://github.com/kabirdhillon7)
- LinkedIn: [Kabir Dhillon](https://www.linkedin.com/in/kabirdhillon/)
