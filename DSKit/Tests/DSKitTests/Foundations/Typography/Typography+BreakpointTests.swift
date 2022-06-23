//
//  Typography+BreakpointTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class TypographyBreakpointTests: NotoSansFontTestCase {
    func testLabel() {
        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPhone12)
        XCTAssertTypographyEqual(Typography.Label.current(), Typography.Label.small)

        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPadLandscape)
        XCTAssertTypographyEqual(Typography.Label.current(), Typography.Label.medium)

        UIApplicationStub.shared =  UIApplicationMock(frame: CGRect.monitor6K)
        XCTAssertTypographyEqual(Typography.Label.current(), Typography.Label.large)

        UIApplicationStub.shared = UIApplication.shared
    }

    func testParagraph() {
        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPhone12)
        XCTAssertTypographyEqual(Typography.Paragraph.current(), Typography.Paragraph.small)

        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPadLandscape)
        XCTAssertTypographyEqual(Typography.Paragraph.current(), Typography.Paragraph.medium)

        UIApplicationStub.shared =  UIApplicationMock(frame: CGRect.monitor6K)
        XCTAssertTypographyEqual(Typography.Paragraph.current(), Typography.Paragraph.large)

        UIApplicationStub.shared = UIApplication.shared
    }
}
