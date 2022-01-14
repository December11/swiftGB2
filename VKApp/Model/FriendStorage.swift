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
        Friend(firstName: "Booker",
               secondName: "De Witt",
               userPhoto: nil),
        Friend(firstName: "Daizy",
               secondName: "Fitzroy",
               userPhoto: nil),
        Friend(firstName: " Rosalind",
               secondName: "Lutece",
               userPhoto: nil),
        Friend(firstName: "Robert",
               secondName: "Lutece",
               userPhoto: nil),
        Friend(firstName: "Zachary",
               secondName: "Hale Comstock",
               userPhoto: nil),
        Friend(firstName: "Elizabeth",
               secondName: "",
               userPhoto: nil),
        Friend(firstName: "Jeremiah",
               secondName: "Fink",
               userPhoto: nil),
        Friend(firstName: "Cornelius",
               secondName: "Slate",
               userPhoto: nil)
    ]
    
     func getIndexes() -> [String: [Friend]] {
         var dictionary = [String: [Friend]]()
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
    
    func getArrayForKey(for key: String ) -> [Friend] {
        var array = [Friend]()
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


