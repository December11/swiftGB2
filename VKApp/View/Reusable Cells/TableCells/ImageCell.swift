//
//  ImageCell.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var photo: UIImageView!
    
    
    func configureCell(userPic: UIImage?, label: String) {
        self.photo.image = userPic ?? UIImage(systemName: "photo.fill")
        self.label.text = label
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
