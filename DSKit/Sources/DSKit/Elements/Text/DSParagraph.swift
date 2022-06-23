//
//  DSParagraph.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public class DSParagraph: TypographyLabel {
    public convenience init() {
        self.init(typography: .Paragraph.medium)
    }

    public required init(typography: Typography) {
        super.init(typography: typography)
        textColor = .contentPrimary
        numberOfLines = 0
    }

    required init?(coder: NSCoder) { nil }
}
