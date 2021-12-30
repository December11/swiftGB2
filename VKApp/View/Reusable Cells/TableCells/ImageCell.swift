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
    @IBOutlet weak var abbreviationLabel: UILabel!
    @IBOutlet weak var userPicView: UIView!
    
    func configureCell(userPic: UIImage?, label: String) {
        self.photo.image = userPic ?? nil
        self.label.text = label
    }
    
    func configureCell(label: String, color: CGColor) {
        userPicView.layer.backgroundColor = color
        
        self.abbreviationLabel.text = makeAbbrevation(string: label)
        self.label.text = label
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Private functions
    
    private func countWordsInString(of string: String) -> Int {
        var temp = string.count > 0 ? 1 : 0
        for symbol in string {
            if symbol == " " {
                temp += 1
            }
        }
        return temp
    }

    private func makeAbbrevation(string: String) -> String? {
        guard
            countWordsInString(of: string) != 0
        else { return nil }
        
        var abbrevation = ""
        if countWordsInString(of: string) == 1 {
            abbrevation += string.prefix(1)
            return abbrevation
        } else {
            let temp = string.split(separator: " ")
            for substring in temp
            where abbrevation.count < 2 {
                abbrevation += substring.prefix(1)
            }
        }
        return abbrevation.uppercased()
    }

    
}
