//
//  AllGroupTableViewSearch.swift
//  VKApp
//
//  Created by Alla Shkolnik on 14.01.2022.
//

import UIKit

extension AllGroupTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredGroups = searchText.isEmpty
        ? groups
        : filteredGroups.filter(
            {(searchedGroup: Group) -> Bool in
                return searchedGroup.title.range(of: searchText, options: .caseInsensitive) != nil
            })
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
}
