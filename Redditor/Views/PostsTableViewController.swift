//
//  PostsTableViewController.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import UIKit

class PostsTableViewController: UITableViewController {
    var posts = [Post]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { return 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")

        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuseIdentifier")
        }

        guard indexPath.row < posts.count else { return cell }

        let post = posts[indexPath.row]

        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = "\(post.ups) ups  |  \(post.downs) downs"

        color(cell: cell, for: indexPath)

        return cell
    }

    func color(cell: UITableViewCell, for indexPath: IndexPath) {
        if indexPath.row % 2 == 0 {
            cell.textLabel?.textColor = .white
            cell.detailTextLabel?.textColor = .lightGray
            cell.backgroundColor = .darkGray
        }
    }

}
