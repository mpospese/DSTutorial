//
//  Typography+HeadingTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/20/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class TypographyHeadingTests: NotoSansFontTestCase {
    let types: [Typography] = [
        .Heading.small,
        .Label.large,
        .Label.medium,
        .Label.small,
        .Paragraph.large,
        .Paragraph.medium,
        .Paragraph.small
    ]

    func testFont() {
        let traits = UITraitCollection(preferredContentSizeCategory: .large)

        // Given a Typography and default content size (large)
        types.forEach {
            // The font family name should be NotoSans
            XCTAssertEqual($0.fontFamily.familyName, "NotoSans")
            // Line height should always be greater than font size
            XCTAssertGreaterThan($0.lineHeight, $0.fontSize)

            let layout = $0.generateLayout(compatibleWith: traits)
            XCTAssertNotNil(layout.font)
            // The font point size should exactly match the Typography
            XCTAssertEqual(layout.font.pointSize, $0.fontSize)
            // The font family name should be "Noto Sans" (with a space)
            XCTAssertEqual(layout.font.familyName, "Noto Sans")
        }
    }
}
