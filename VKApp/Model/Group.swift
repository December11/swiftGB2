//
//  Group.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
//

import Foundation
import UIKit

struct Group {
    let title: String
    let groupPicture: UIImage?
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.groupPicture = image ?? UIImage(systemName: "person.3.fill")
    }
}
