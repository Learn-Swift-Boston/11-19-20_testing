//
//  DrawerViewController.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import UIKit

protocol SubredditDelegate: NSObject {
    var posts: [Post] { get }

    func get(subreddit: String)
}

class DrawerViewController: UIViewController {

    weak var delegate: SubredditDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func calculateStats(posts: [Post]) -> (upSum: Int, downSum: Int) {
        var upSum = 0
        var downSum = 0

        for post in posts {
            upSum += post.ups
            downSum += post.downs
        }

        return (upSum, downSum)
    }

}
