//
//  DSTextField.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public class DSTextField: TypographyTextField {
    public convenience init() {
        self.init(typography: .Paragraph.medium)
    }

    required public init(typography: Typography) {
        super.init(typography: typography)
        setUpUI()
    }

    required init?(coder: NSCoder) { nil }

    public override var placeholder: String? {
        didSet {
            guard let placeholder = placeholder else {
                return
            }

            attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.contentTertiary]
            )
        }
    }

    override open var isEnabled: Bool {
        didSet {
            if isEnabled != oldValue {
                adjustColors()
            }
        }
    }

    override public func adjustColors() {
        super.adjustColors()

        textColor = isEnabled ? .contentPrimary : .contentStateDisabled
        tintColor = textColor
        backgroundColor = isEnabled ? .backgroundTertiary : .backgroundStateDisabled
        layer.borderColor = isEnabled ? UIColor.borderSelected.cgColor : nil
    }

    override open func adjustBreakpoint() {
        super.adjustBreakpoint()
        textInsets = calculateInsets()
    }

    open func calculateInsets() -> UIEdgeInsets {
        UIEdgeInsets(topAndBottom: Spacing.mediumSmall, leftAndRight: Spacing.medium)
    }
}

private extension DSTextField {
    func setUpUI() {
        // observe when text field gains / loses focus, so that we can show the border
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidBeginEditing),
            name: UITextField.textDidBeginEditingNotification,
            object: self
        )
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(textDidEndEditing),
            name: UITextField.textDidEndEditingNotification,
            object: self
        )
    }

    @objc
    func textDidBeginEditing() {
        adjustBorder(isVisible: true)
    }

    @objc
    func textDidEndEditing() {
        adjustBorder(isVisible: false)
    }

    func adjustBorder(isVisible: Bool) {
        layer.borderWidth = isVisible ? 2 : 0
    }
}

// MARK: - Unit Test Helpers

// These functions are marked as internal to be accessible to unit tests,
// but not from outside of the package.
internal extension DSTextField {
    func simulateBeginEditing() {
        textDidBeginEditing()
    }

    func simulateEndEditing() {
        textDidEndEditing()
    }
}
