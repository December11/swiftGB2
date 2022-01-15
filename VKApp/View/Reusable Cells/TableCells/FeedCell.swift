//
//  FeedCell.swift
//  VKApp
//
//  Created by Alla Shkolnik on 15.01.2022.
//

import UIKit

final class FeedCell: UITableViewCell {
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var feedCreationDate: UILabel!
    @IBOutlet weak var userPhotoBackground: UIView!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var acronym: UILabel!
    @IBOutlet weak var feedMessage: UILabel!
    @IBOutlet weak var feedImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    
    var feed: Feed?
    
    func configureFeedCell(feed: Feed) {
        self.userName.text = feed.user.userName
        self.feedCreationDate.text = feed.date.toString(dateFormat: .dateTime)
        self.userPhotoBackground.backgroundColor = UIColor(cgColor: feed.user.codeColor)
        self.userPhoto.isHidden = feed.user.userPhoto == nil
        self.userPhoto.image = feed.user.userPhoto?.img ?? nil
        self.acronym.isHidden = feed.user.userPhoto != nil
        self.acronym.text = feed.user.userName.acronym
        self.feedMessage.isHidden = feed.messageText == nil
        self.feedMessage.text = feed.messageText
        self.feedImage.isHidden = feed.image == nil
        self.feedImage.image = feed.image?.img ?? nil
        self.feed = feed
        
    }
    
    @IBAction func like(_ sender: UIButton) {
        sender.isSelected.toggle()
        feed?.isLiked.toggle()
        let count = feed?.likesCount ?? 0
        sender.setTitle(String(count), for: .init())
        let imageTitle = sender.isSelected ? "hand.thumbsup.circle.fill" : "hand.thumbsup.circle"
        sender.setImage(UIImage(systemName: imageTitle), for: .init())
        
    }
    
    
    
}
