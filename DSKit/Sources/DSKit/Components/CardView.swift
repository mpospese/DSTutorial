//
//  CardView.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YCoreUI

public class CardView: UIView {
    private static let imageRatio: CGFloat = (216.0 / 375.0)
    private static let iconSize = CGSize(width: 56, height: 56)

    public let insets = NSDirectionalEdgeInsets(
        topAndBottom: Spacing.medium,
        leadingAndTrailing: Spacing.medium
    )

    public let banner: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: imageRatio)
            .isActive = true

        return imageView
    }()

    private let middleView = UIView()
    private let textContainerView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Spacing.mediumSmall

        return stackView
    }()

    public let heading: UILabel = DSHeading()
    public let paragraph: UILabel = DSParagraph()
    public let icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.heightAnchor.constraint(equalToConstant: iconSize.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: iconSize.width).isActive = true

        return imageView
    }()
    public let button: UIButton = DSButton()

    public required override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }

    required init?(coder: NSCoder) { nil }

    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            adjustColors()
        }
    }

    open func adjustColors() {
        layer.borderColor = UIColor.borderOpaque.cgColor
    }
}

private extension CardView {
    func setUpUI() {
        addSubviews()
        configureSubviews()
        addConstraints()

        layer.borderWidth = 2
        adjustColors()
    }

    func addSubviews() {
        addSubview(banner)
        addSubview(middleView)

        middleView.addSubview(textContainerView)
        middleView.addSubview(icon)
        middleView.addSubview(button)

        textContainerView.addArrangedSubview(heading)
        textContainerView.addArrangedSubview(paragraph)
    }

    func configureSubviews() {
        banner.image = DSImages.cow.image

        heading.text = "Heading"

        paragraph.text = "Paragraph"

        icon.image = DSImages.award.image

        button.setTitle("Button", for: .normal)
        button.setTitle("Pressed", for: .highlighted)
        button.setTitle("Disabled", for: .disabled)
    }

    func addConstraints() {
        banner.constrainEdges(.notBottom)

        middleView.constrain(below: banner, offset: Spacing.medium)
        middleView.constrainEdges(.notTop, with: insets)

        textContainerView.constrainEdges([.top, .leading])

        icon.constrain(after: textContainerView, offset: Spacing.medium)
        icon.constrainEdges([.top, .trailing])

        button.constrain(below: textContainerView, offset: Spacing.medium)
        button.constrainEdges(.notTop)
    }
}
