//
//  imageCollectionCell.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet var photo: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    var friend: Friend?
    
    override func awakeFromNib() {
        likeButton.setTitle("", for: .normal)
        likeButton.setImage(UIImage(systemName: "hand.thumbsup.circle"), for: .normal)
        likeButton.setTitle("1", for: .selected)
        likeButton.setImage(UIImage(systemName: "hand.thumbsup.circle.fill"), for: .selected)
    }
    
    @IBAction func likeButtonPressed (_ sender: UIButton) {
        sender.isSelected.toggle()
        sender.backgroundColor = .white
        friend?.isLike = sender.isSelected
    }
    
    func configureItem(friend: Friend?) {
        self.friend = friend
        photo.image = friend?.userPhoto ?? UIImage(systemName: "photo")
        likeButton.isSelected = friend?.isLike ?? false
        
    }
    
}
