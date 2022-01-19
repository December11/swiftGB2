//
//  FeedComparable.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 15.01.2022.
//

import Foundation

extension Feed: Comparable {
    static func < (lhs: Feed, rhs: Feed) -> Bool {
        lhs.date < rhs.date
    }
    
    static func == (lhs: Feed, rhs: Feed) -> Bool {
        lhs.date == rhs.date && lhs.user == rhs.user
    }
}
