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
        
        if self.userPhoto != nil { self.photos.append(userPhoto!) }
        codeColor = CGColor(red: CGFloat.random(in: 155...255)/255,
                        green: CGFloat.random(in: 155...255)/255,
                        blue: CGFloat.random(in: 155...255)/255,
                        alpha: 1.0)
    }
    
    func addPhoto (_ photo: Photo) {
        photos.append(photo)
    }
    
    private func countWordsInString(of string: String) -> Int {
        var temp = string.count > 0 ? 1 : 0
        for symbol in string {
            if symbol == " " {
                temp += 1
            }
        }
        return temp
    }
    
    private func getInitials(string: String) -> String? {
        guard
            countWordsInString(of: string) != 0
        else { return nil }
        
        var abbrevation = ""
        if countWordsInString(of: string) == 1 {
            abbrevation += string.prefix(1)
            return abbrevation
        } else {
            let temp = string.split(separator: " ")
            for substring in temp
            where abbrevation.count < 2 {
                abbrevation += substring.prefix(1)
            }
        }
        return abbrevation.uppercased()
    }
}
    
