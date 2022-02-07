//
//  Friend.swift
//  VKApp
//
//  Created by Alla Shkolnik on 25.12.2021.
//

import UIKit

final class User {
    let firstName: String
    let secondName: String
    var userName: String {
        firstName + " " + secondName
    }
    var userPhoto: Photo?
    let codeColor: CGColor
    var photos = [Photo]() //в виде массива на будущее. Все фотки пользователя, могут быть показаны на экране фото
    
    init(firstName: String, secondName: String, userPhoto: Photo?, photos: [Photo]) {
        self.firstName = firstName
        self.secondName = secondName
        self.userPhoto = userPhoto ?? nil
        self.photos = photos
        
        codeColor = CGColor(red: CGFloat.random(in: 155...255)/255,
                        green: CGFloat.random(in: 155...255)/255,
                        blue: CGFloat.random(in: 155...255)/255,
                        alpha: 1.0)
    }
  
}
    
