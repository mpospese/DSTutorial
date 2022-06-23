//
//  DSLabel.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public class DSLabel: TypographyLabel {
    public convenience init() {
        self.init(typography: .Label.medium)
    }

    public required init(typography: Typography) {
        super.init(typography: typography)
        textColor = .contentPrimary
        numberOfLines = 1
    }

    required init?(coder: NSCoder) { nil }
}
