//
//  Photo.swift
//  VKApp
//
//  Created by Alla Shkolnik on 03.01.2022.
//

import UIKit

final class Photo {
    let image: UIImage?
    var isLiked: Bool = false
    
    init(image: UIImage?) {
        self.image = image ?? nil
    }
}
