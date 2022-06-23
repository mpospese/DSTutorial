//
//  DSBreakpointParagraphTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSBreakpointParagraphTests: BreakPointElementTestCase {
    func testBreakpointParagraph() {
        let sut = makeSUT()
        // typography should match current breakpoint
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.current())

        // given we adjust the screen size to small, typography should match small
        adjust(sut, to: .small)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.small)

        // given we adjust the screen size to medium, typography should match medium
        adjust(sut, to: .medium)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.medium)

        // given we adjust the screen size to large, typography should match large
        adjust(sut, to: .large)
        XCTAssertTypographyEqual(sut.typography, Typography.Paragraph.large)
    }
}

private extension DSBreakpointParagraphTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSBreakpointParagraph()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
