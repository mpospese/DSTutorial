//
//  FormViewTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class FormViewTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertEqual(sut.fields.count, 2)
        sut.fields.forEach {
            XCTAssertEqual($0.label.text, "Label")
            XCTAssertEqual($0.textField.placeholder, "Placeholder...")
            XCTAssertEqual($0.hintLabel.text, "Hint")
        }
        XCTAssertEqual(sut.button.currentTitle, "Button")
    }

    func testInitWithCoder() throws {
        let sut = FormView(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }
}

private extension FormViewTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> FormView {
        let sut = FormView()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}
