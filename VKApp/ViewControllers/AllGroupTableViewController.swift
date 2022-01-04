//
//  AllGroupTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class AllGroupTableViewController: UITableViewController {

    let groups = GroupStorage.shared.groups
    
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
