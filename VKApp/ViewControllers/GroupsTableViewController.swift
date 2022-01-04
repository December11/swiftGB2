//
//  GroupsTableViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 18.12.2021.
//

import UIKit

class GroupsTableViewController: UITableViewController {
    
    var groups = [Group]()
                  
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addGroup",
            let allGroupsController = segue.source as? AllGroupTableViewController,
            let groupIndexPath = allGroupsController.tableView.indexPathForSelectedRow
        else { return }
        let group = allGroupsController.groups[groupIndexPath.row]
        if !self.groups.contains(group) {
            self.groups.append(allGroupsController.groups[groupIndexPath.row])
        }
        tableView.reloadData()
    }

    //MARK: - Lifecycle
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
            
        currentGroup.groupPicture != nil
            ? cell.configureCell(
                userPic: currentGroup.groupPicture,
                label: currentGroup.title)
            : cell.configureCell(label: currentGroup.title, color: currentGroup.colorCode)

        return cell
    }

    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
}
