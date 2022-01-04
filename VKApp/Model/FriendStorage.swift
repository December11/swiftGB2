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
        Friend(firstName: "Anna",
               secondName: "Mitchel",
               userPhoto: Photo(image: UIImage(named: "photo1.png"))),
        Friend(firstName: "Gregory",
               secondName: "Lass",
               userPhoto: Photo(image: UIImage(named: "photo2.png"))),
        Friend(firstName: "Kate",
               secondName: "Bolac",
               userPhoto: Photo(image: UIImage(named: "photo3.png"))),
        Friend(firstName: "Alice",
               secondName: "Morgan",
               userPhoto: Photo(image: UIImage(named: "photo4.png"))),
        Friend(firstName: "Peter",
               secondName: "Bosko",
               userPhoto: Photo(image: UIImage(named: "photo5.png"))),
        Friend(firstName: "Ann",
               secondName: "Wood",
               userPhoto: nil),
        Friend(firstName: "Danila",
               secondName: "Kovchiy",
               userPhoto: Photo(image: UIImage(named: "photo7.png"))),
        Friend(firstName: "Alex",
               secondName: "La Cruse",
               userPhoto: nil)
    ]
    
     func getIndexes() -> [String: [Friend]] {
         var dictionary = [String: [Friend]]()
         for person in FriendStorage.shared.friends {
             let key = String(person.secondName.prefix(1))
             if !dictionary.keys.contains(key) {
                 let array = getArrayForKey(for: key)
                 dictionary.updateValue(array, forKey: key)
             }
        }
        return dictionary
    }
    
    func getArrayForKey(for key: String ) -> [Friend] {
        var array = [Friend]()
        for friend in FriendStorage.shared.friends {
            if String(friend.secondName.prefix(1)) == key {
                array.append(friend)
            }
        }
        return array.sorted()
    }
    
    func getSortedKeyArray() -> [String] {
        let array = [String](getIndexes().keys)
        return array.sorted()
    }
    
//    func removeDublicates(in array: [Friend]) -> [Friend] {
//        var result = [Friend]()
//        result.append(array[0])
//        for friend in friends {
//            if
//        }
//    }
    
}


