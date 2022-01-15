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
    
    func configureCell(
        label: String,
        additionalLabel: String?,
        picture: UIImage?,
        color: CGColor?) {
            
        // делаем фамилию жирной, если это список друзей
        let attributedString = NSMutableAttributedString(string: label)
        if let secondName = additionalLabel {
            attributedString.append(NSMutableAttributedString(string: " "))
            attributedString.append(secondName.bold)
        }
        self.label.attributedText = attributedString
        userPicView.layer.backgroundColor = color ?? UIColor.yellow.cgColor
        abbreviationLabel.isHidden = picture != nil
        photo.isHidden = picture == nil
            
        let name = additionalLabel == nil ? label : label + " " + additionalLabel!
        abbreviationLabel.text = picture == nil ? name.acronym : nil
        photo.image = picture ?? nil
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
