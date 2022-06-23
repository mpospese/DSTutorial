//
//  DSButtonTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSButtonTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.medium)
        XCTAssertEqual(sut.maximumScaleFactor, 2)
        XCTAssertEqual(sut.contentEdgeInsets, UIEdgeInsets(topAndBottom: 14, leftAndRight: Spacing.medium))
        XCTAssertColorEqual(sut.currentTitleColor, UIColor.contentPrimary)
        XCTAssertColorEqual(sut.backgroundColor, UIColor.backgroundTertiary)

        sut.isHighlighted = true
        XCTAssertColorEqual(sut.currentTitleColor, UIColor.contentPrimary)
        XCTAssertColorEqual(
            sut.backgroundColor,
            UIColor.backgroundTertiary.blended(by: 0.08, with: .primaryA)
        )

        sut.isHighlighted = false
        sut.isEnabled = false
        XCTAssertColorEqual(sut.currentTitleColor, UIColor.contentStateDisabled)
        XCTAssertColorEqual(sut.backgroundColor, UIColor.backgroundStateDisabled)
    }

    func testInitWithCoder() throws {
        let sut = DSButton(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension DSButtonTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> DSButton {
        let sut = DSButton()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
