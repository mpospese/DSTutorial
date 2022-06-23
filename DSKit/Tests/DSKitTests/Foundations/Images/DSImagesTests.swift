//
//  DSImagesTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/21/22.
//

import XCTest
@testable import DSKit

final class DSImagesTests: XCTestCase {
    func testImages() {
        DSImages.allCases.forEach {
            XCTAssertNotNil($0.image)
        }
    }
}
