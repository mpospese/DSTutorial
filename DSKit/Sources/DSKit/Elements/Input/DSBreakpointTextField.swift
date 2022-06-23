//
//  DSBreakpointTextField.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSBreakpointTextField: DSTextField {
    public convenience init() {
        // use size from current breakpoint
        self.init(typography: .Paragraph.current())
    }

    // adjust breakpoint if necessary
    public override func adjustBreakpoint() {
        super.adjustBreakpoint()
        typography = .Paragraph.current()
    }

    public override func calculateInsets() -> UIEdgeInsets {
        let insets: UIEdgeInsets
        switch Breakpoint.current() {
        case .small:
            // { 8, 16, 8, 16 }
            insets = DSTextFieldSmall.insets
        case .medium:
            // { 12, 16, 12, 16 }
            insets = DSTextFieldMedium.insets
        case .large:
            // { 14, 16, 14, 16 }
            insets = DSTextFieldLarge.insets
        }
        return insets
    }
}
