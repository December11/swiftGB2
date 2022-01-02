//
//  Photo.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 03.01.2022.
//

import UIKit

final class Photo {
    let img: UIImage?
    var isLike: Bool = false
    
    init(image: UIImage?) {
        self.img = image ?? nil
    }
}
