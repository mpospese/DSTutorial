//
//  BreakpointElementTestCase.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

class BreakPointElementTestCase: NotoSansFontTestCase {
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        UIApplicationStub.shared = UIApplication.shared
    }

    func adjust(_ element: TypographyLabel, to size: Breakpoint) {
        UIApplicationStub.shared = size.mock
        element.adjustBreakpoint()
    }
}
