//
//  DSLabelTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSLabelTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.typography, .Label.medium)
        XCTAssertEqual(sut.numberOfLines, 1)
        XCTAssertColorEqual(sut.textColor, UIColor.contentPrimary)
    }

    func testInitWithCoder() throws {
        let sut = DSLabel(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension DSLabelTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> DSLabel {
        let sut = DSLabel()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
