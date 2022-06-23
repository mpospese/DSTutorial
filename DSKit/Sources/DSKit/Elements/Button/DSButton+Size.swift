//
//  DSButton+Size.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSButtonLarge: DSButton {
    public convenience init() {
        self.init(typography: .Label.large)
    }

    /// { 16, 20, 16, 20 }
    public static let insets = UIEdgeInsets(
        topAndBottom: Spacing.medium,
        leftAndRight: Spacing.mediumLarge
    )

    public override func calculateInsets() -> UIEdgeInsets {
        DSButtonLarge.insets
    }
}

public final class DSButtonMedium: DSButton {
    public convenience init() {
        self.init(typography: .Label.medium)
    }

    /// { 14, 16, 14, 16 }
    public static let insets = UIEdgeInsets(
        topAndBottom: 14,
        leftAndRight: Spacing.medium
    )

    public override func calculateInsets() -> UIEdgeInsets {
        DSButtonMedium.insets
    }
}

public final class DSButtonSmall: DSButton {
    public convenience init() {
        self.init(typography: .Label.small)
    }

    /// { 10, 12, 10, 12 }
    public static let insets = UIEdgeInsets(
        topAndBottom: 10,
        leftAndRight: Spacing.mediumSmall
    )

    public override func calculateInsets() -> UIEdgeInsets {
        DSButtonSmall.insets
    }
}
