//
//  DSParagraph+SizeTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSParagraphSizeTests: NotoSansFontTestCase {
    func testSmall() {
        let sut = makeSmallSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.small)
    }

    func testMedium() {
        let sut = makeMediumSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.medium)
    }

    func testLarge() {
        let sut = makeLargeSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.large)
    }
}

private extension DSParagraphSizeTests {
    func makeSmallSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSParagraphSmall()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeMediumSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSParagraphMedium()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeLargeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSParagraphLarge()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
