//
//  CardComponentController.swift
//  DSTutorial
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import DSKit

class CardComponentController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Card"
        tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: "list.bullet.below.rectangle"), tag: 0)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
}

private extension CardComponentController {
    func configureSubviews() {
        view.backgroundColor = .backgroundPrimary
    }
}
