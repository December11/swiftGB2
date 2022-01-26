//
//  FriendStorage.swift
//  VKApp
//
//  Created by Alla Shkolnik on 04.01.2022.
//

import UIKit

final class FriendStorage {
    static let shared = FriendStorage()
    
    let friends = [
        User(firstName: "Anna",
             secondName: "Mitchel",
             userPhoto: Photo(image: UIImage(named: "photo1.png")),
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Gregory",
             secondName: "Lass",
             userPhoto: Photo(image: UIImage(named: "photo2.png")),
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Kate",
             secondName: "Bolac",
             userPhoto: Photo(image: UIImage(named: "photo3.png")),
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Alice",
             secondName: "Morgan",
             userPhoto: Photo(image: UIImage(named: "photo4.png")),
             photos: [Photo]()),
        User(firstName: "Peter",
             secondName: "Bosko",
             userPhoto: Photo(image: UIImage(named: "photo5.png")),
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Ann",
             secondName: "Wood",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: "Danila",
             secondName: "Kovchiy",
             userPhoto: Photo(image: UIImage(named: "photo7.png")),
             photos: [Photo]()),
        User(firstName: "Booker",
             secondName: "De Witt",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: "Daizy",
             secondName: "Fitzroy",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: " Rosalind",
             secondName: "Lutece",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: "Robert",
             secondName: "Lutece",
             userPhoto: nil,
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Zachary",
             secondName: "Hale Comstock",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: "Elizabeth",
             secondName: "",
             userPhoto: nil,
             photos: [Photo]()),
        User(firstName: "Jeremiah",
             secondName: "Fink",
             userPhoto: nil,
             photos: [
                Photo(image: UIImage(named: "photo1.png")),
                Photo(image: UIImage(named: "photo2.png")),
                Photo(image: UIImage(named: "photo3.png")),
                Photo(image: UIImage(named: "photo4.png"))
             ]),
        User(firstName: "Cornelius",
             secondName: "Slate",
             userPhoto: nil,
             photos: [Photo]())
    ]
    
    func getIndexes() -> [String: [User]] {
        var dictionary = [String: [User]]()
        for friend in FriendStorage.shared.friends {
            let key = friend.secondName == ""
            ?  String(friend.firstName.prefix(1))
            :  String(friend.secondName.prefix(1))
            if !dictionary.keys.contains(key) {
                let array = getArrayForKey(for: key)
                dictionary.updateValue(array, forKey: key)
            }
        }
        return dictionary
    }
    
    func getArrayForKey(for key: String ) -> [User] {
        var array = [User]()
        for friend in FriendStorage.shared.friends {
            let keyValue = friend.secondName == ""
            ?  String(friend.firstName.prefix(1))
            :  String(friend.secondName.prefix(1))
            if keyValue == key {
                array.append(friend)
            }
        }
        return array.sorted()
    }
    
    func getSortedKeyArray() -> [String] {
        let array = [String](getIndexes().keys)
        return array.sorted()
    }
}


