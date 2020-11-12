//
//  ListViewController.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import UIKit

class ListViewController: UIViewController {
    let postTableVC = PostsTableViewController(style: .plain)

    override func viewDidLoad() {
        super.viewDidLoad()
        addChild(postTableVC)
        view.addSubview(postTableVC.tableView)
        postTableVC.didMove(toParent: self)

        // Do any additional setup after loading the view.
        Client().fetch(subreddit: "aww") { (result) in
            switch result {
            case .success(let posts):
                self.postTableVC.posts = posts
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        postTableVC.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            postTableVC.tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postTableVC.tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postTableVC.tableView.topAnchor.constraint(equalTo: view.topAnchor),
            postTableVC.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    

}
