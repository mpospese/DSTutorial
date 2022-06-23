//
//  DSTextField+SizeTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSTextFieldSizeTests: NotoSansFontTestCase {
    func testSmall() {
        let sut = makeSmallSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.small)
        XCTAssertEqual(sut.textInsets, DSTextFieldSmall.insets)
    }

    func testMedium() {
        let sut = makeMediumSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.medium)
        XCTAssertEqual(sut.textInsets, DSTextFieldMedium.insets)
    }

    func testLarge() {
        let sut = makeLargeSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.large)
        XCTAssertEqual(sut.textInsets, DSTextFieldLarge.insets)
    }
}

private extension DSTextFieldSizeTests {
    func makeSmallSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyTextField {
        let sut = DSTextFieldSmall()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeMediumSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyTextField {
        let sut = DSTextFieldMedium()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeLargeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyTextField {
        let sut = DSTextFieldLarge()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
