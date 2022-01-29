//
//  FeedViewController.swift
//  VKApp
//
//  Created by Alla Shkolnik on 15.01.2022.
//

import UIKit

final class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var feedNews = FeedStorage.shared.feedNews.sorted(by: { $0 > $1 })
   
    @IBOutlet var loadingViews: [UIView]!
    @IBOutlet weak var animatedView: UIView!
    
    private let loadDuration = 20.0
    private let shortDuration = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingDotes()
        _ = Timer.scheduledTimer(timeInterval: loadDuration, target: self, selector: #selector(updateFeeds), userInfo: nil, repeats: false)
    }
    
    @objc func updateFeeds() {
        self.animatedView.isHidden = true
        feedNews = FeedStorage.shared.feedNews.sorted(by: { $0 > $1 })
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
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    //MARK: -Animation
    func loadingDotes() {
        UIView.animate(withDuration: shortDuration, delay: 0, options: [.repeat, .autoreverse, .curveEaseInOut]) { [self] in
            loadingViews[0].alpha = 1
        }
        UIView.animate(withDuration: shortDuration, delay: 0.2, options: [.repeat, .autoreverse, .curveEaseInOut]) { [self] in
            loadingViews[1].alpha = 1
        }
        UIView.animate(withDuration: shortDuration, delay: 0.4, options: [.repeat, .autoreverse, .curveEaseInOut]) { [self] in
            loadingViews[2].alpha = 1
        }
    }
}
