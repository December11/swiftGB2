//
//  AllGroupTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {
    
    var groups = [
        Group(title: "Swift developers", image: UIImage(
            named: "groupPhoto2.jpg")),
        Group(title: "Apple insider", image: nil),
        Group(title: "wathcing WWDC together'22", image: nil),
        Group(title: "Freelance office jobs for Swift developers",
              image: UIImage(named: "groupPhoto1.jpg"))]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(
            UINib(nibName: "ImageCell", bundle: nil),
            forCellReuseIdentifier: "imageCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
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
            
        let currentGroup = groups[indexPath.row]
            
        cell.configureCell(
            userPic: currentGroup.groupPicture,
            label: currentGroup.title)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {tableView.deselectRow(
            at: indexPath,
            animated: true) }
        performSegue(withIdentifier: "addGroup", sender: nil)
    }

}
