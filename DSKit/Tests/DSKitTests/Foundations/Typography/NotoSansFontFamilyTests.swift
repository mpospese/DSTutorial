//
//  NotoSansFontFamilyTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/20/22.
//

import XCTest
@testable import DSKit

final class NotoSansFontFamilyTests: XCTestCase {
    func testRegisterFonts() {
        XCTAssertNoThrow(try NotoSansFontFamily.registerFonts())
        XCTAssertThrowsError(try NotoSansFontFamily.registerFonts())
        XCTAssertNoThrow(try NotoSansFontFamily.unregisterFonts())
        XCTAssertThrowsError(try NotoSansFontFamily.unregisterFonts())
    }
}
