//
//  FriendsTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class FriendsTableViewController: UITableViewController {
    
    var friends = [
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
        Friend(firstName: "Ann", secondName: "Wood", userPhoto: nil),
        Friend(firstName: "Danila",
               secondName: "Kovchiy",
               userPhoto: Photo(image: UIImage(named: "photo7.png"))),
        Friend(firstName: "Alex", secondName: "La Cruse", userPhoto: nil)
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            guard
                let photosController = segue.destination
                    as? FriendCollectionViewController,
                let indexPath = sender as? IndexPath
            else { return }
            photosController.friend = self.friends[indexPath.row]
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

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "imageCell",
                for: indexPath)
                as? ImageCell
        else { return UITableViewCell() }
            
        let currentFriend = friends[indexPath.row]
            if indexPath.row <= 3 {
                friends[indexPath.row].photos.append(Photo(image: UIImage(named: "photo6.png")))
            }
            
        currentFriend.userPhoto != nil
        ? cell.configureCell(
            userPic: currentFriend.userPhoto?.img,
            label: currentFriend.userName)
            : cell.configureCell(label: currentFriend.userName, color: currentFriend.colorCode)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView .deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "showPhotos", sender: indexPath)
    }

}
