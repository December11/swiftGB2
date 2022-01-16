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
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var imgScrollView: UIScrollView!
    @IBOutlet weak var imgView: UIView!
    
    var feedImageViews = [UIImageView]()
    var feed: Feed?
    
    func configureFeedCell(feed: Feed) {
        self.userName.text = feed.user.userName
        feedCreationDate.text = feed.date.toString(dateFormat: .dateTime)
        userPhotoBackground.backgroundColor = UIColor(cgColor: feed.user.codeColor)
        
        //проверяем и обнуляем значения чтобы не было ошибок при переиспользовании ячейки
        self.userPhoto.isHidden = feed.user.userPhoto == nil
        acronym.isHidden = feed.user.userPhoto != nil
        feedMessage.isHidden = feed.messageText == nil
        imgView.isHidden = feed.images.isEmpty
        
        self.userPhoto.image = feed.user.userPhoto?.image ?? nil
        acronym.text = feed.user.userName.acronym
        feedMessage.text = feed.messageText
        
        imgScrollView.contentSize = CGSize(width: (UIScreen.main.bounds.width - 32) * CGFloat(feed.images.count),
                                          height: UIScreen.main.bounds.width - 32)
        
        for i in 0..<feed.images.count {
            feedImageViews.append(UIImageView(image: feed.images[i].image))
            feedImageViews[i].frame = CGRect(x: (UIScreen.main.bounds.width - 32) * CGFloat(i),
                                             y: 0,
                                             width: UIScreen.main.bounds.width - 32,
                                             height: UIScreen.main.bounds.width - 32)
            feedImageViews[i].contentMode = .scaleAspectFit
            imgScrollView.cornerRadius = 8
            imgScrollView.addSubview(feedImageViews[i])
        }
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
