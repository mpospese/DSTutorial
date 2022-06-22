//
//  MainViewController.swift
//  DSTutorial
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit

final class MainViewController: UITabBarController {
    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabs()
    }
}

private extension MainViewController {
    private func configureTabs() {
        setViewControllers([
            UINavigationController(rootViewController: CardComponentController()),
            UINavigationController(rootViewController: FormModuleController())
        ], animated: false)
    }
}
