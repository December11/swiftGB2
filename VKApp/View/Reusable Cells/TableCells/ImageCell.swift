//
//  ImageCell.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var photo: UIImageView!
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var userPicView: UIView!
    
    func configureCell(userPic: UIImage?, label: String) {
        self.photo.image = userPic ?? nil
        self.label.text = label
    }
    
    func configureCell(label: String, color: CGColor) {
        userPicView.layer.backgroundColor = color
        
        self.abbreviationLabel.text = label.getAcronym()
        self.label.text = label
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
