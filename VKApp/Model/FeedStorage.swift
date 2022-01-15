//
//  FeedStorage.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 15.01.2022.
//

import UIKit

final class FeedStorage {
    static let shared = FeedStorage()
    
    var feedNews = [
        Feed(user: FriendStorage.shared.friends[7],
             messageText: "Some message",
             image: Photo(image: UIImage(named: "groupPhoto2.png"))),
        Feed(user: FriendStorage.shared.friends[12],
             messageText: "another some message. Maybe so long to be on two strings, maybe no",
             image: nil),
        Feed(user: FriendStorage.shared.friends[2],
             messageText: "another some message. Maybe so long to be on two strings",
             image: nil),
        Feed(user: FriendStorage.shared.friends[8],
             messageText: "another some message. Maybe so long to be on two strings",
             image: Photo(image: UIImage(named: "groupPhoto1.png"))),
        Feed(user: FriendStorage.shared.friends[2],
             messageText: "another some message. Maybe so long to be on two strings",
             image: nil)
        ]
}
