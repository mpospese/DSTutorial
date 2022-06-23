//
//  FormView.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YCoreUI
import YMatterType

public class FormView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Spacing.medium

        return stackView
    }()

    // initialize with two fields for demo purposes
    public private (set) var fields: [FormField] = [
        FormField(),
        FormField()
    ]
    public let button = DSButton()

    public required override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder: NSCoder) { nil }
}

private extension FormView {
    func setUpUI() {
        addSubviews()
        configureSubviews()
    }

    func addSubviews() {
        addSubview(stackView)
        addSubview(button)

        fields.forEach {
            stackView.addArrangedSubview($0)
        }

        stackView.constrainEdges(.notBottom)

        button.constrain(below: stackView, relatedBy: .greaterThanOrEqual, offset: Spacing.medium)
        button.constrainEdges(.notTop)
    }

    func configureSubviews() {
        button.setTitle("Button", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
        button.setTitle("Disabled", for: .disabled)
    }
}
