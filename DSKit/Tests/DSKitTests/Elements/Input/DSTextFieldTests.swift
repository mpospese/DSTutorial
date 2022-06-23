//
//  DSTextFieldTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class DSTextFieldTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertTypographyEqual(sut.typography, .Paragraph.medium)

        XCTAssertColorEqual(sut.textColor, UIColor.contentPrimary)
        XCTAssertColorEqual(sut.backgroundColor, UIColor.backgroundTertiary)

        sut.isEnabled = false
        XCTAssertColorEqual(sut.textColor, UIColor.contentStateDisabled)
        XCTAssertColorEqual(sut.backgroundColor, UIColor.backgroundStateDisabled)
    }

    func testInitWithCoder() throws {
        let sut = DSTextField(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }

    func testFocusBorder() {
        let sut = makeSUT()
        XCTAssertFalse(sut.isBorderVisible)
        sut.becomeFirstResponder()
        sut.simulateBeginEditing()
        XCTAssertTrue(sut.isBorderVisible)
        sut.simulateEndEditing()
        XCTAssertFalse(sut.isBorderVisible)
    }

    func testPlaceholder() {
        let sut = makeSUT()
        // given we set the placeholder text, we expect it to be styled
        // with contentTertiary color.
        sut.placeholder = "Placeholder"
        XCTAssertEqual(
            sut.attributedPlaceholder?.getUniversalAttribute(for: .foregroundColor) as? UIColor,
            UIColor.contentTertiary
        )

        // given we clear the placeholder text, the attributed placeholder text
        // should be cleared as well.
        sut.placeholder = nil
        XCTAssertNil(sut.attributedPlaceholder)
    }
}

fileprivate extension DSTextField {
    var isBorderVisible: Bool { layer.borderWidth > 0 && layer.borderColor != nil }
}

private extension DSTextFieldTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> DSTextField {
        let sut = DSTextField()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
