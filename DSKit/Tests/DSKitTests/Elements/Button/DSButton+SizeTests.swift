//
//  DSButton+SizeTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSButtonSizeTests: NotoSansFontTestCase {
    func testSmall() {
        let sut = makeSmallSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.small)
        XCTAssertEqual(sut.contentEdgeInsets, DSButtonSmall.insets)
    }

    func testMedium() {
        let sut = makeMediumSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.medium)
        XCTAssertEqual(sut.contentEdgeInsets, DSButtonMedium.insets)
    }

    func testLarge() {
        let sut = makeLargeSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.large)
        XCTAssertEqual(sut.contentEdgeInsets, DSButtonLarge.insets)
    }
}

private extension DSButtonSizeTests {
    func makeSmallSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyButton {
        let sut = DSButtonSmall()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeMediumSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyButton {
        let sut = DSButtonMedium()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeLargeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyButton {
        let sut = DSButtonLarge()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
