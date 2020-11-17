//
//  UIViewControllerExtension.swift
//  Redditor
//
//  Created by Matt Dias on 11/17/20.
//

import UIKit.UIViewController

extension UIViewController {
    func add(_ viewController: UIViewController) {
        viewController.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(viewController.view)
        addChild(viewController)
        viewController.didMove(toParent: self)
    }
}
