//
//  Input.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YCoreUI
import YMatterType

public class FormField: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Spacing.small

        return stackView
    }()

    public let label = DSLabel()
    public let textField = DSTextField()
    public let hintLabel: DSParagraph = {
        let hint = DSParagraph(typography: .Paragraph.small)
        hint.textColor = .contentTertiary
        hint.isHidden = false

        return hint
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder: NSCoder) { nil }
}

private extension FormField {
    func setUpUI() {
        addSubviews()
        configureSubviews()
    }

    func addSubviews() {
        addSubview(stackView)
        stackView.constrainEdges()

        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(hintLabel)
    }

    func configureSubviews() {
        label.text = "Label"
        textField.placeholder = "Placeholder..."
        hintLabel.text = "Hint"
    }
}
