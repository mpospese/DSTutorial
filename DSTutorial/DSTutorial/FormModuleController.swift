//
//  FormModuleController.swift
//  DSTutorial
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit

class FormModuleController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Form"
        tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: "list.bullet"), tag: 0)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSubviews()
    }
}

private extension FormModuleController {
    func configureSubviews() {
        view.backgroundColor = .systemBackground
    }
}
