//
//  Friend.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import Foundation
import UIKit

final class Friend {
    let firstName: String
    let secondName: String
    var userName: String {
        firstName + " " + secondName
    }
    var userPhoto: UIImage?
    var isLike = false
    let colorCode: CGColor
    
    init(firstName: String, secondName: String, userPhoto: UIImage?) {
        self.firstName = firstName
        self.secondName = secondName
        self.userPhoto = userPhoto ?? nil
        colorCode = CGColor(red: CGFloat.random(in: 155...255)/255,
                        green: CGFloat.random(in: 155...255)/255,
                        blue: CGFloat.random(in: 155...255)/255,
                        alpha: 1.0)
    }
}
