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
    @IBOutlet weak var pageControl: UIPageControl!
    
    var feedImageViews = [UIImageView]()
    var feed: Feed?
    
    func configureFeedCell(feed: Feed) {
        self.feed = feed
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
        
        // определяем ширину для скроллвью
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
        pageControl.numberOfPages = feed.images.count
    }
    
    override func awakeFromNib() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(userPhotoTapped(_:)))
        userPhotoBackground.addGestureRecognizer(gesture)
        likeButton.configuration?.background.backgroundColor = .clear
    }
    
    
    @objc
    func userPhotoTapped(_ sender: Any) {
        UIView.animate(withDuration: 0.2) { 
            self.userPhotoBackground.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        } completion: { _ in
            UIView.animate(withDuration: 0.2) {
                self.userPhotoBackground.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }
        }
    }
    
    @IBAction func like(_ sender: UIButton) {
        sender.isSelected.toggle()
        feed?.isLiked.toggle()
        
        let count = feed?.likesCount ?? 0
        sender.setTitle(String(count), for: .init())
        likeAnimate()
    }
    
    func likeAnimate() {
        UIView.transition(with: self.likeButton, duration: 0.1, options: .transitionCrossDissolve) { [self] in
            let image = likeButton.isSelected
            ? UIImage(systemName: "hand.thumbsup.circle.fill")
            : UIImage(systemName: "hand.thumbsup.circle")
            likeButton.setImage(image, for: .init())
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: .curveEaseInOut) { [self] in
            likeButton.imageView?.frame.origin.y += 1
        } completion: { [self] isCompletion in
            likeButton.imageView?.frame.origin.y -= 1
        }
    }
    
    func tapAtImageAnimate() {
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut) { [self] in
            userPhoto.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        } completion: { isCompletion in
            print("tapped on image")
        }
    }
}

extension FeedCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = floor(scrollView.contentOffset.x / scrollView.bounds.width)
        pageControl.currentPage = Int(page)
    }
}
