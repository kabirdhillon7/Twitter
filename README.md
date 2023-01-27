# Twitter
Twitter is a basic twitter app to view, compose, favorite, and retweet tweets using the [Twitter API](https://developer.twitter.com/en/docs/twitter-api)

Twitter is in proccess of being designed using the Model-View-ViewModel (MVVM) pattern, which separates the app's data model, user interface, and business logic into distinct components.

## Table of Contents

- [Description](#description)
- [Requirements](#Requirements)
- [Demo](#demo)
- [Installation](#installation)
- [Testing](#testing)
- [Contact](#contact)

## Description

Some of the main features include:
- [X] User sees app icon in home screen and styled launch screen.
- [X] User can log in.
- [X] User can log out.
- [X] User stays logged in across restarts.
- [X] User can view tweets with the user profile picture, username, and tweet text.
- [X] User can pull to refresh.
- [X] User can load past tweets infinitely.
- [X] User can compose a tweet.
- [X] User can favorite a tweet.
- [X] User can retweet a tweet.
- [X] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 280)

The following **bonus** features are to be implemented:
- [ ] User can view their profile in a profile tab.
- [ ] User sees embedded images in tweet if available.

## Requirements
- iOS 13.0 or later
- iPhone 6s or newer
- iPod touch 7th generation or newer

## Demo
### Current Progress Walkthrough

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


## Testing

Information on how to test the project, including any automation scripts or test suites that have been set up.

## Dependencies
  
- [AFNetworking](https://github.com/AFNetworking/AFNetworking) (MIT License)
- [Alamofire](https://github.com/Alamofire/Alamofire) (MIT License)
- [Alamofire Image](https://github.com/Alamofire/AlamofireImage) (MIT License)
- [BDBOAuth1Manager](https://github.com/bdbergeron/BDBOAuth1Manager)

## Contact

If you have any questions or feedback, you can reach me through the following channels:

- GitHub: [@kabirdhillon7](https://github.com/kabirdhillon7)
- LinkedIn: [Kabir Dhillon](https://www.linkedin.com/in/kabirdhillon/)

<!-- 

# Twitter - Part II

This is a basic twitter app to view, compose, favorite, and retweet tweets.

Time spent: **5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User can compose a tweet. (4pts)
- [X] User can favorite a tweet. (4pts)
- [X] User can retweet a tweet. (2pts)

The following **bonus** features are implemented:

- [ ] When composing a tweet, user sees a countdown for the number of characters remaining for the tweet (out of 280) (2pts)
- [ ] User can view their profile in a profile tab. (3pts)
- [ ] User sees embedded images in tweet if available. (3pts)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/kabirdhillon7/Twitter/blob/main/Walkthrough%202.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />

# Twitter - Part I

This is a basic twitter app to read your tweets.

Time spent: **5** hours spent in total

## User Stories

The following **required** functionality is completed:

- [X] User sees app icon in home screen and styled launch screen. (1pt)
- [X] User can log in. (1pt)
- [X] User can log out. (1pt)
- [X] User stays logged in across restarts. (1pt)
- [X] User can view tweets with the user profile picture, username, and tweet text. (6pts)

The following **bonus** features are implemented:

- [X] User can pull to refresh. (1pt)
- [X] User can load past tweets infinitely. (2pts)

## Video Walkthrough

Here's a walkthrough of implemented user stories:

<img src='https://github.com/kabirdhillon7/Twitter/blob/main/Walkthrough%201.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />
-->
