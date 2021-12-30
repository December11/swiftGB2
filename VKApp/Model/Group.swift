//
//  Group.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import Foundation
import UIKit

struct Group {
    let title: String
    let groupPicture: UIImage?
    let colorCode: CGColor
    
    init(title: String, image: UIImage?) {
        self.title = title
        self.groupPicture = image ?? nil
        colorCode = CGColor(red: CGFloat.random(in: 155...255)/255,
                        green: CGFloat.random(in: 155...255)/255,
                        blue: CGFloat.random(in: 155...255)/255,
                        alpha: 1.0)
    }
}
