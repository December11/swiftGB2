//
//  AllGroupTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    let groups = GroupStorage.shared.groups
    var filteredGroups = GroupStorage.shared.groups
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.placeholder = "Search some group"
        tableView.register(
            UINib(nibName: "ImageCell", bundle: nil),
            forCellReuseIdentifier: "imageCell")
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredGroups.count
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
            
        let currentGroup = filteredGroups[indexPath.row]
            cell.configureCell(label: currentGroup.title, additionalLabel: nil, picture: currentGroup.groupPicture, color: currentGroup.codeColor)
            
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer {tableView.deselectRow(
            at: indexPath,
            animated: true) }
        performSegue(withIdentifier: "addGroup", sender: nil)
    }

}
