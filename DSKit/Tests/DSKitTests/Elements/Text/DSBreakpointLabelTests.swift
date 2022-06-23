//
//  DSBreakpointLabelTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSBreakpointLabelTests: BreakPointElementTestCase {
    func testBreakpointLabel() {
        let sut = makeSUT()
        // typography should match current breakpoint
        XCTAssertTypographyEqual(sut.typography, Typography.Label.current())

        // given we adjust the screen size to small, typography should match small
        adjust(sut, to: .small)
        XCTAssertTypographyEqual(sut.typography, Typography.Label.small)

        // given we adjust the screen size to medium, typography should match medium
        adjust(sut, to: .medium)
        XCTAssertTypographyEqual(sut.typography, Typography.Label.medium)

        // given we adjust the screen size to large, typography should match large
        adjust(sut, to: .large)
        XCTAssertTypographyEqual(sut.typography, Typography.Label.large)
    }
}

private extension DSBreakpointLabelTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> TypographyLabel {
        let sut = DSBreakpointLabel()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
