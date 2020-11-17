//
//  ListViewController.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import UIKit

class ListViewController: UIViewController, SubredditDelegate {
    let postTableVC = PostsTableViewController(style: .plain)
    var drawerVC = DrawerViewController()
    var selectedSubreddit = "aww" {
        didSet {
            get(subreddit: selectedSubreddit)
        }
    }
    var posts = [Post]() {
        didSet {
            self.postTableVC.posts = posts
            DispatchQueue.main.async {
                self.drawerVC.refreshUI()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        add(postTableVC)

        drawerVC.delegate = self
        add(drawerVC)

        // Do any additional setup after loading the view.
        get(subreddit: selectedSubreddit)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NSLayoutConstraint.activate([
            postTableVC.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableVC.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableVC.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableVC.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            drawerVC.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            drawerVC.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            drawerVC.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

    func get(subreddit: String) {
        Client().fetch(subreddit: subreddit) { (result) in
            switch result {
            case .success(let posts):
                self.posts = posts
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
