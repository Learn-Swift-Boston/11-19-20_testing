//
//  DrawerViewController.swift
//  Redditor
//
//  Created by Matt Dias on 11/10/20.
//

import UIKit

protocol SubredditDelegate: NSObject {
    var posts: [Post] { get }
    var selectedSubreddit: String { get set }
}

class DrawerViewController: UIViewController {

    weak var delegate: SubredditDelegate?
    let mainStack = UIStackView()

    let textfield = UITextField()
    let subredditLabel = UILabel()
    let topHStack = UIStackView()

    let upsLabel = UILabel()
    let downsLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        topHStack.distribution = .fill
        topHStack.alignment = .fill

        textfield.backgroundColor = .systemBackground
        textfield.autocorrectionType = .no

        view.backgroundColor = .systemGroupedBackground
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        view.addSubview(mainStack)

        subredditLabel.text = "Subreddit: "
        subredditLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        textfield.text = delegate?.selectedSubreddit
        textfield.delegate = self
        mainStack.addArrangedSubview(topHStack)
        topHStack.addArrangedSubview(subredditLabel)
        topHStack.addArrangedSubview(textfield)

        upsLabel.accessibilityIdentifier = "ups label"
        downsLabel.accessibilityIdentifier = "downs label"
        upsLabel.text = "?? total up votes"
        downsLabel.text = "?? total down votes"
        mainStack.addArrangedSubview(upsLabel)
        mainStack.addArrangedSubview(downsLabel)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            mainStack.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
        ])
    }

    func refreshUI() {
        let stats = calculateStats(posts: delegate?.posts ?? [])
        upsLabel.text = "\(stats.upSum) total up votes"
        downsLabel.text = "\(stats.downSum) total down votes"
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

extension DrawerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let subreddit = textfield.text else { return true }

        delegate?.selectedSubreddit = subreddit

        return true
    }
}
