//
//  FriendsTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    // MARK: - Переменные
    //let friends = FriendStorage.shared.friends
    //var filteredFriends = FriendStorage.shared.friends
    let friendsDictionary = FriendStorage.shared.getIndexes()
    let friendsDictionaryKeysArray = FriendStorage.shared.getSortedKeyArray()
    
    // для поиска
   // var filteredFriendsDictionaryKeys = FriendStorage.shared.getSortedKeyArray()
    //var filteredFriendsDictionary = FriendStorage.shared.getIndexes()
    
    
    // MARK: - Данные для экрана Фото
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            guard
                let photosController = segue.destination
                    as? FriendCollectionViewController,
                let indexPath = sender as? IndexPath
            else { return }
            
            let currentSectionNumber = indexPath.section
            let currentKeyArray = friendsDictionaryKeysArray[currentSectionNumber]
            let friendsForCurrentKeyArray =
                FriendStorage.shared.getArrayForKey(for: currentKeyArray)
            let currentFriend = friendsForCurrentKeyArray[indexPath.row]
            photosController.friend = currentFriend
        }
    }

    // MARK: - Table view data source
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "ImageCell", bundle: nil),
            forCellReuseIdentifier: "imageCell")
    }
    
    @IBAction func dismiss() {
        dismiss(animated: true)
    }

    // MARK: - Секции и вывод строк
    override func numberOfSections(in tableView: UITableView) -> Int {
        return friendsDictionaryKeysArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = friendsDictionaryKeysArray
        return FriendStorage.shared.getArrayForKey(for: array[section]).count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return friendsDictionaryKeysArray[section]
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "imageCell",
                for: indexPath)
                as? ImageCell
        else { return UITableViewCell() }
        
        // все чтобы получить нужного друга в нужной секции
        let currentSectionNumber = indexPath.section
        let currentKeyArray = friendsDictionaryKeysArray[currentSectionNumber]
        let friendsForCurrentKeyArray =
            FriendStorage.shared.getArrayForKey(for: currentKeyArray)
        let currentFriend = friendsForCurrentKeyArray[indexPath.row]
        
        cell.configureCell(
            label: currentFriend.firstName,
            additionalLabel: currentFriend.secondName,
            picture: currentFriend.userPhoto?.image,
            color: currentFriend.codeColor)
        return cell
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return friendsDictionaryKeysArray
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        defer { tableView .deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "showPhotos", sender: indexPath)
    }
    
    
    
}
