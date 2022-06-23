//
//  FormModuleController.swift
//  DSTutorial
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import DSKit
import YCoreUI

class FormModuleController: FormViewController {
    let form = FormView()

    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Form"
        tabBarItem = UITabBarItem(title: title, image: UIImage(systemName: "list.bullet"), tag: 0)
    }

    required init?(coder: NSCoder) { nil }

    override func configureSubviews() {
        super.configureSubviews()

        scrollView.backgroundColor = .backgroundPrimary
        contentView.addSubview(form)
        form.constrainEdges()

        // pin the button to the bottom
        fitContentToScreen()
    }
}
