//
//  ColorsTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/20/22.
//

import XCTest
import YCoreUI
@testable import DSKit

final class ColorsTests: XCTestCase {
    typealias ColorInputs = (foreground: UIColor, background: UIColor, context: WCAGContext)

    let colorPairs: [ColorInputs] = [
        // Primary text
        (.contentPrimary, .backgroundPrimary, .normalText),
        // Input text
        (.contentPrimary, .backgroundTertiary, .normalText)

        // Enable these pairings to see what failure looks like
        // Input hint
        // (.contentTertiary, .backgroundPrimary, .normalText),
        // Input edges
        // (.backgroundTertiary, .backgroundPrimary, .uiComponent),
    ]

    func testColorContrast() {
        // test across all color modes we support
        for traits in UITraitCollection.allColorSpaces {
            // test each color pair
            colorPairs.forEach {
                let color1 = $0.foreground.resolvedColor(with: traits)
                let color2 = $0.background.resolvedColor(with: traits)

                XCTAssert(
                    color1.isSufficientContrast(to: color2, context: $0.context, level: .AA),
                    String(
                        format: "#%@ vs #%@ ratio = %.02f under %@ Mode%@",
                        color1.rgbDisplayString(),
                        color2.rgbDisplayString(),
                        color1.contrastRatio(to: color2),
                        traits.userInterfaceStyle == .dark ? "Dark" : "Light",
                        traits.accessibilityContrast == .high ? " Increased Contrast" : ""
                    )
                )
            }
        }
    }
}
