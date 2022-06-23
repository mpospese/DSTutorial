//
//  DSTextField+Size.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSTextFieldLarge: DSTextField {
    public convenience init() {
        self.init(typography: .Paragraph.large)
    }

    /// { 14, 16, 14, 16 }
    public static let insets = UIEdgeInsets(
        topAndBottom: 14,
        leftAndRight: Spacing.medium
    )

    override public func calculateInsets() -> UIEdgeInsets {
        DSTextFieldLarge.insets
    }
}

public final class DSTextFieldMedium: DSTextField {
    public convenience init() {
        self.init(typography: .Paragraph.medium)
    }

    /// { 12, 16, 12, 16 }
    public static let insets = UIEdgeInsets(
        topAndBottom: Spacing.mediumSmall,
        leftAndRight: Spacing.medium
    )

    override public func calculateInsets() -> UIEdgeInsets {
        DSTextFieldMedium.insets
    }
}

public final class DSTextFieldSmall: DSTextField {
    public convenience init() {
        self.init(typography: .Paragraph.small)
    }

    /// { 8, 16, 8, 16 }
    public static let insets = UIEdgeInsets(
        topAndBottom: Spacing.small,
        leftAndRight: Spacing.medium
    )

    override public func calculateInsets() -> UIEdgeInsets {
        DSTextFieldSmall.insets
    }
}
