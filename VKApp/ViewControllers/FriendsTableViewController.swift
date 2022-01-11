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
               userPhoto: UIImage(named: "photo1.png")),
        Friend(firstName: "Gregory",
               secondName: "Lass",
               userPhoto: UIImage(named: "photo2.png")),
        Friend(firstName: "Kate",
               secondName: "Bolac",
               userPhoto: UIImage(named: "photo3.png")),
        Friend(firstName: "Alice",
               secondName: "Morgan",
               userPhoto: UIImage(named: "photo4.png")),
        Friend(firstName: "Peter",
               secondName: "Bosko",
               userPhoto: UIImage(named: "photo5.png")),
        Friend(firstName: "Ann",
               secondName: "Wood",
               userPhoto: UIImage(named: "photo6.png")),
        Friend(firstName: "Danila",
               secondName: "Kovchiy",
               userPhoto: UIImage(named: "photo7.png"))
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPhotos" {
            guard
                let photosController = segue.destination
                    as? PhotosCollectionViewController,
                let indexPath = sender as? IndexPath
            else { return }
            photosController.image = self.friends[indexPath.row].userPhoto
                    
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
            
        cell.configureCell(
            userPic: currentFriend.userPhoto,
            label: currentFriend.userName)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView .deselectRow(at: indexPath, animated: true) }
        performSegue(withIdentifier: "showPhotos", sender: indexPath)
    }

}
