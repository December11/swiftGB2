//
//  imageCollectionCell.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {

    @IBOutlet var photo: UIImageView!
    
    func configureItem(image: UIImage?) {
        self.photo.image = image ?? UIImage(systemName: "photo")
    }
}
