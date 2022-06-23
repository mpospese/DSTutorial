//
//  DSBreakpointParagraph.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import YMatterType

public final class DSBreakpointParagraph: DSParagraph {
    public convenience init() {
        // use size from current breakpoint
        self.init(typography: .Paragraph.current())
    }

    // adjust breakpoint if necessary
    public override func adjustBreakpoint() {
        super.adjustBreakpoint()
        typography = .Paragraph.current()
    }
}
