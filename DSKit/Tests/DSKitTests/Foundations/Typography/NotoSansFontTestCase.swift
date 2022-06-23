//
//  NotoSansFontTestCase.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
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

    func XCTAssertTypographyEqual(_ expression1: Typography, _ expression2: Typography) {
        XCTAssertEqual(expression1.fontFamily.familyName, expression2.fontFamily.familyName)
        XCTAssertEqual(expression1.fontFamily.fontNameSuffix, expression2.fontFamily.fontNameSuffix)
        XCTAssertEqual(expression1.fontWeight, expression2.fontWeight)
        XCTAssertEqual(expression1.fontSize, expression2.fontSize)
        XCTAssertEqual(expression1.lineHeight, expression2.lineHeight)
        XCTAssertEqual(expression1.letterSpacing, expression2.letterSpacing)
        XCTAssertEqual(expression1.textCase, expression2.textCase)
        XCTAssertEqual(expression1.textDecoration, expression2.textDecoration)
        XCTAssertEqual(expression1.textStyle, expression2.textStyle)
        XCTAssertEqual(expression1.isFixed, expression2.isFixed)
    }

    func XCTAssertColorEqual(_ expression1: UIColor?, _ expression2: UIColor?) {
        // resolve the color across all color spaces we support
        // (light vs dark) x (regular vs increased contrast)
        UITraitCollection.allColorSpaces.forEach {
            XCTAssertEqual(expression1?.resolvedColor(with: $0), expression2?.resolvedColor(with: $0))
        }
    }

    // Used to test required init?(coder: NSCoder)
    func makeCoder(for view: UIView) throws -> NSCoder {
        let data = try NSKeyedArchiver.archivedData(withRootObject: view, requiringSecureCoding: false)
        return try NSKeyedUnarchiver(forReadingFrom: data)
    }
}
