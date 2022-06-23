//
//  NotoSansFontTestCase.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import DSKit

/// Base class for any test case that requires the use of the NotoSans font family.
/// Attempts to register the fonts on setup and to unregister them on teardown
class NotoSansFontTestCase: XCTestCase {
    override func setUpWithError() throws {
        try NotoSansFontFamily.registerFonts()
    }

    override func tearDownWithError() throws {
        try NotoSansFontFamily.unregisterFonts()
    }
}
