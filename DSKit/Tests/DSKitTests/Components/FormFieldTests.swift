//
//  FormFieldTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class FormFieldTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.label.typography, .Label.medium)
        XCTAssertTypographyEqual(sut.textField.typography, .Paragraph.medium)
        XCTAssertTypographyEqual(sut.hintLabel.typography, .Paragraph.small)
        XCTAssertColorEqual(sut.label.textColor, UIColor.contentPrimary)
        XCTAssertColorEqual(sut.textField.textColor, UIColor.contentPrimary)
        XCTAssertColorEqual(sut.hintLabel.textColor, UIColor.contentTertiary)

        XCTAssertEqual(sut.label.text, "Label")
        XCTAssertEqual(sut.textField.placeholder, "Placeholder...")
        XCTAssertEqual(sut.hintLabel.text, "Hint")
    }

    func testInitWithCoder() throws {
        let sut = FormField(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension FormFieldTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> FormField {
        let sut = FormField()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
