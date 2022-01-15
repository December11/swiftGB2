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
    var image: Photo?
    
    var isLike = false
    var likesCount = 0
    
    var commentsCount = 0
    var viewsCount = 0
    
    init(user: User, messageText: String?, image: Photo?) {
        self.user = user
        self.messageText = messageText
        self.image = image
        
        // для проверки работы сортировки по дате
        self.date = Date() - TimeInterval.random(in: 0...3600)
    }
    
    
}