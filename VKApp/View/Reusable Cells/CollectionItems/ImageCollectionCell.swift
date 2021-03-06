//
//  imageCollectionCell.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet var photoImageView: UIImageView!
    //@IBOutlet var likeButton: UIButton!
    @IBOutlet weak var imageCollectionView: UIView!
    
    @IBOutlet weak var photoWidthConstraint: NSLayoutConstraint!
    
    var photo: Photo?
    
//    override func awakeFromNib() {
//        likeButton.setTitle("", for: .normal)
//        likeButton.setImage(UIImage(systemName: "hand.thumbsup.circle"), for: .normal)
//        likeButton.setTitle("1", for: .selected)
//        likeButton.setImage(UIImage(systemName: "hand.thumbsup.circle.fill"), for: .selected)
//    }
//
//    @IBAction func likeButtonPressed (_ sender: UIButton) {
//        sender.isSelected.toggle()
//        sender.backgroundColor = .white
//        photo?.isLiked = sender.isSelected
//    }
    
    func configureItem(picture: Photo?) {
        self.photo = picture
        self.photoImageView.image = picture?.image ?? nil
        self.photoWidthConstraint.constant = UIScreen.main.bounds.width / 3 - 2
        //likeButton.isSelected = picture?.isLiked ?? false
    }
}
