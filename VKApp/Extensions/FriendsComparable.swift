//
//  FriendsComparable.swift
//  VKApp
//
//  Created by Alla Shkolnik on 04.01.2022.
//

import Foundation

extension Friend: Comparable {
    static func < (lhs: Friend, rhs: Friend) -> Bool {
        lhs.secondName < rhs.secondName
    }
    
    static func == (lhs: Friend, rhs: Friend) -> Bool {
        lhs.userName == rhs.userName
    }
}
