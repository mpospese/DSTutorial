//
//  DSHeading.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public class DSHeading: TypographyLabel {
    public convenience init() {
        self.init(typography: .Heading.small)
    }
    
    public required init(typography: Typography) {
        super.init(typography: typography)
        textColor = .contentPrimary
        numberOfLines = 1
    }

    required init?(coder: NSCoder) { nil }
}
