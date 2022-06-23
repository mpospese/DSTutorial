//
//  DSBreapointTextFieldTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSBreakpointTextFieldTests: BreakPointElementTestCase {
    func testBreakpointTextField() {
        let sut = makeSUT()
        // typography should match current breakpoint
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.current())

        // given we adjust the screen size to small, typography should match small
        adjust(sut, to: .small)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.small)
        XCTAssertEqual(sut.textInsets, DSTextFieldSmall.insets)

        // given we adjust the screen size to medium, typography should match medium
        adjust(sut, to: .medium)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.medium)
        XCTAssertEqual(sut.textInsets, DSTextFieldMedium.insets)

        // given we adjust the screen size to large, typography should match large
        adjust(sut, to: .large)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.large)
        XCTAssertEqual(sut.textInsets, DSTextFieldLarge.insets)
    }
}

private extension DSBreakpointTextFieldTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyTextField {
        let sut = DSBreakpointTextField()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
