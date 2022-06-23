//
//  Typography+Breakpoint.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public extension Typography.Label {
    static func current() -> Typography {
        let typography: Typography
        switch Breakpoint.current() {
        case .small:
            typography = small
        case .medium:
            typography = medium
        case .large:
            typography = large
        }
        return typography
    }
}

public extension Typography.Paragraph {
    static func current() -> Typography {
        let typography: Typography
        switch Breakpoint.current() {
        case .small:
            typography = small
        case .medium:
            typography = medium
        case .large:
            typography = large
        }
        return typography
    }
}
