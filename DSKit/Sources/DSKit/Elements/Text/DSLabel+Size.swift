//
//  DSLabel+Size.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSLabelLarge: DSLabel {
    public convenience init() {
        self.init(typography: .Label.large)
    }
}

public final class DSLabelMedium: DSLabel {
    public convenience init() {
        self.init(typography: .Label.medium)
    }
}

public final class DSLabelSmall: DSLabel {
    public convenience init() {
        self.init(typography: .Label.small)
    }
}
