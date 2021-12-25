//
//  GroupsEquatable.swift
//  VKApp
//
//  Created by 👩🏻‍🎨 📱 december11 on 25.12.2021.
//

import Foundation

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        lhs.title == rhs.title
    }
}
