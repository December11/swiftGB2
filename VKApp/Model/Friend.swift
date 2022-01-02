//
//  Friend.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import UIKit

final class Friend {
    let firstName: String
    let secondName: String
    var userName: String {
        firstName + " " + secondName
    }
    var userPhoto: Photo?
    var isLike = false
    let colorCode: CGColor
    var photos = [Photo]()
    
    init(firstName: String, secondName: String, userPhoto: Photo?) {
        self.firstName = firstName
        self.secondName = secondName
        self.userPhoto = userPhoto ?? nil
        
        if self.userPhoto != nil { photos.append(userPhoto!) }
        colorCode = CGColor(red: CGFloat.random(in: 155...255)/255,
                        green: CGFloat.random(in: 155...255)/255,
                        blue: CGFloat.random(in: 155...255)/255,
                        alpha: 1.0)
    }
    
    func addPhoto (photo: Photo) {
        photos.append(photo)
    }
}
    
