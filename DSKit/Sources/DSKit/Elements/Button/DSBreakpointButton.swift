//
//  DSBreakpointButton.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSBreakpointButton: DSButton {
    public convenience init() {
        // use size from current breakpoint
        self.init(typography: .Label.current())
    }

    // adjust breakpoint if necessary
    public override func adjustBreakpoint() {
        super.adjustBreakpoint()
        typography = .Label.current()
    }

    public override func calculateInsets() -> UIEdgeInsets {
        let insets: UIEdgeInsets
        switch Breakpoint.current() {
        case .small:
            // { 10, 12, 10, 12 }
            insets = DSButtonSmall.insets
        case .medium:
            // { 14, 16, 14, 16 }
            insets = DSButtonMedium.insets
        case .large:
            // { 16, 20, 16, 20 }
            insets = DSButtonLarge.insets
        }
        return insets
    }
}
