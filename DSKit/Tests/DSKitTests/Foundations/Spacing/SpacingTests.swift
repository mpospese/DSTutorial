//
//  SpacingTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/20/22.
//

import XCTest
@testable import DSKit

final class SpacingTests: XCTestCase {
    func testSpacing() {
        let spacings = [
            Spacing.small,
            Spacing.mediumSmall,
            Spacing.medium,
            Spacing.mediumLarge
        ]

        var previousValue: CGFloat = -1

        // Given a spacing
        spacings.forEach {
            // each spacing should be larger than the previous one
            XCTAssertGreaterThan($0, previousValue)
            // each spacing should be an integer
            XCTAssertEqual(CGFloat(Int($0)), $0)
            // each spacing should be a multiple of 4
            XCTAssertEqual(Int($0) % 4, 0)

            previousValue = $0
        }
    }
}
