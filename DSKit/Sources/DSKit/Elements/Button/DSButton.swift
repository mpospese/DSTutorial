//
//  DSButton.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YMatterType

public class DSButton: TypographyButton {
    public convenience init() {
        self.init(typography: .Label.medium)
    }

    public required init(typography: Typography) {
        super.init(typography: typography)
        maximumScaleFactor = 2
        contentEdgeInsets = UIEdgeInsets(topAndBottom: 14, leftAndRight: Spacing.medium)
    }

    required init?(coder: NSCoder) { nil }

    override open var isHighlighted: Bool {
        didSet {
            if isHighlighted != oldValue {
                adjustColors()
            }
        }
    }

    override open var isEnabled: Bool {
        didSet {
            if isEnabled != oldValue {
                adjustColors()
            }
        }
    }

    override open func adjustColors() {
        super.adjustColors()

        switch state {
        case .highlighted:
            backgroundColor = UIColor.backgroundTertiary.blended(by: 0.08, with: .primaryA)
        case .disabled:
            backgroundColor = .backgroundStateDisabled
        default:
            backgroundColor = .backgroundTertiary
        }

        setTitleColor(isEnabled ? .contentPrimary : .contentStateDisabled, for: state)
    }
}
