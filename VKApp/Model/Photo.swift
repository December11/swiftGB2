//
//  Photo.swift
//  VKApp
//
//  Created by Alla Shkolnik on 03.01.2022.
//

import UIKit

final class Photo {
    let img: UIImage?
    var isLiked: Bool = false
    
    init(image: UIImage?) {
        self.img = image ?? nil
    }
}
