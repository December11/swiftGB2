//
//  Friend.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
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
    
    init(firstName: String, secondName: String, userPhoto: UIImage?) {
        self.firstName = firstName
        self.secondName = secondName
        self.userPhoto = userPhoto ?? UIImage(systemName: "person.fill")
    }
}
