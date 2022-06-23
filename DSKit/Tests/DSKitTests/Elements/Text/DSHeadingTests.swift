//
//  DSHeadingTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSHeadingTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.typography, .Heading.small)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertColorEqual(sut.textColor, UIColor.contentPrimary)
    }

    func testInitWithCoder() throws {
        let sut = DSHeading(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension DSHeadingTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> DSHeading {
        let sut = DSHeading()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
