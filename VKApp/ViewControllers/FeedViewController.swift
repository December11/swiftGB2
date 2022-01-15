//
//  FeedViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 15.01.2022.
//

import UIKit

final class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let feedNews = FeedStorage.shared.feedNews.sorted(by: { $0 > $1 })
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feedNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as? FeedCell
        else { return UITableViewCell() }
        
        let currentFeed = feedNews[indexPath.row]
        cell.configureFeedCell(feed: currentFeed)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        defer { tableView.deselectRow(
//            at: indexPath,
//            animated: false) }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
