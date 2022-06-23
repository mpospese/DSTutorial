//
//  DSParagraphTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSParagraphTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.medium)
        XCTAssertEqual(sut.numberOfLines, 0)
        XCTAssertColorEqual(sut.textColor, UIColor.contentPrimary)
    }

    func testInitWithCoder() throws {
        let sut = DSParagraph(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension DSParagraphTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> DSParagraph {
        let sut = DSParagraph()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
