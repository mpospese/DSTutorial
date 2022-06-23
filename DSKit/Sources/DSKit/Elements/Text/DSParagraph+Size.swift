//
//  DSParagraph+Size.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSParagraphLarge: DSParagraph {
    public convenience init() {
        self.init(typography: .Paragraph.large)
    }
}

public final class DSParagraphMedium: DSParagraph {
    public convenience init() {
        self.init(typography: .Paragraph.medium)
    }
}

public final class DSParagraphSmall: DSParagraph {
    public convenience init() {
        self.init(typography: .Paragraph.small)
    }
}
