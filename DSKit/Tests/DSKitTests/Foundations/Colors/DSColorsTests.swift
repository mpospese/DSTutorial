//
//  AssetColorsTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/20/22.
//

import XCTest
@testable import DSKit

final class AssetColorsTests: XCTestCase {
    func testColors() {
        DSColors.allCases.forEach {
            XCTAssertNotNil($0.color)
        }
    }
}
