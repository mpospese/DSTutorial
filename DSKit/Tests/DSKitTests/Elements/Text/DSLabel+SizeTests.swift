//
//  DSLabel+SizeTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSLabelSizeTests: NotoSansFontTestCase {
    func testSmall() {
        let sut = makeSmallSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.small)
    }

    func testMedium() {
        let sut = makeMediumSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.medium)
    }

    func testLarge() {
        let sut = makeLargeSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.large)
    }
}

private extension DSLabelSizeTests {
    func makeSmallSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSLabelSmall()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeMediumSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSLabelMedium()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeLargeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSLabelLarge()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
