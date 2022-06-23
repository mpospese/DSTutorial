//
//  BreakpointElementTestCase.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

protocol BreakpointAdjustable {
    func adjustBreakpoint()
}

extension TypographyLabel: BreakpointAdjustable { }
extension TypographyTextField: BreakpointAdjustable { }
extension TypographyButton: BreakpointAdjustable { }

class BreakPointElementTestCase: NotoSansFontTestCase {
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        UIApplicationStub.shared = UIApplication.shared
    }

    func adjust<T: BreakpointAdjustable>(_ element: T, to size: Breakpoint) {
        UIApplicationStub.shared = size.mock
        element.adjustBreakpoint()
    }
}
