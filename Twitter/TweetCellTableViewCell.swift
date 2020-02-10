//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Sanskar Gyawali on 2/2/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    
    var favourated:Bool = false
    var tweetId:Int = -1
    var retweeted:Bool = false
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorated = !favourated
        if (toBeFavorated){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(isFavourite: true)
            }, failure: { (error) in
                print("Favorite did not succeed:\(error)")
            })
            
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(isFavourite: false)
            }, failure: { (error) in
                print("Unfavorite did not succeed:\(error)")
            })
        }
    }
    
    
    @IBAction func retweet(_ sender: Any) {
        let toretweet = !retweeted
        if(toretweet){
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setRetweeted( isRetweeted: true)
            }, failure: { (Error) in
                print("Error in retweeting")
            })
        }
        else{
            TwitterAPICaller.client?.unreTweet(tweetId: tweetId, success: {
            self.setRetweeted( isRetweeted: false)
            }, failure: { (Error) in
                print("Error in unretweeting")
            })
        }
        }
    
    
    func setFavourite( isFavourite:Bool){
        favourated = isFavourite
        if (favourated){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    
    func setRetweeted(isRetweeted: Bool){
        retweeted = isRetweeted
        if (retweeted){
            retweetButton.setImage(UIImage(named:"retweet-icon-green"), for: UIControl.State.normal)
         //   retweetButton.isEnabled = false;
        }
        else{
            retweetButton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
         //   retweetButton.isEnabled = true;
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
