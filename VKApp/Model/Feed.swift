//
//  Feed.swift
//  VKApp
//
//  Created by Alla Shkolnik on 15.01.2022.
//

import Foundation

final class Feed {
    let date: Date
    let user: User
    
    var messageText: String?
    var images = [Photo]()
    
    var isLiked = false {
        didSet {
            if isLiked {
                likesCount += 1
            } else {
                likesCount -= 1
            }
        }
    }
    var likesCount = 0
    
    var commentsCount = 0
    var viewsCount = 0
    
    init(user: User, messageText: String?, image: [Photo]?) {
        self.user = user
        self.messageText = messageText
        if let photos = image {
            self.images = photos
        }
        // для проверки работы сортировки по дате
        self.date = Date() - TimeInterval.random(in: 0...3600)
    }
}
