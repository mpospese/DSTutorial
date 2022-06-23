//
//  CardViewTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
import YMatterType
@testable import DSKit

final class CardViewTests: NotoSansFontTestCase {
    func testInit() {
        let sut = makeSUT()

        XCTAssertEqual(sut.layer.borderWidth, 2)
        XCTAssertEqual(sut.layer.borderColor, UIColor.borderOpaque.cgColor)
        XCTAssertEqual(sut.heading.text, "Heading")
        XCTAssertEqual(sut.paragraph.text, "Paragraph")
        XCTAssertEqual(sut.button.currentTitle, "Button")
    }

    func testInitWithCoder() throws {
        let sut = CardView(coder: try makeCoder(for: makeSUT()))
        XCTAssertNil(sut)
    }

    func testColorAdjusted() {
        let sut = makeSpy()

        // if traits haven't changed, then colors should not be adjusted
        sut.clear()
        sut.traitCollectionDidChange(sut.traitCollection)
        XCTAssertFalse(sut.isColorAdjusted)

        let sameTraits = UITraitCollection.generateSimilarColorTraits(to: sut.traitCollection)

        // If traits unrelated to colors have changed, then colors should not be adjusted
        sameTraits.forEach {
            sut.clear()
            sut.traitCollectionDidChange($0)
            XCTAssertFalse(sut.isColorAdjusted)
        }

        let differentTraits = UITraitCollection.generateDifferentColorTraits()

        // If traits have changed, then colors should only be adjusted when the traits have a different color appearance
        differentTraits.forEach {
            sut.clear()
            sut.traitCollectionDidChange($0)
            XCTAssertEqual(sut.isColorAdjusted, sut.traitCollection.hasDifferentColorAppearance(comparedTo: $0))
        }
    }
}

private extension CardViewTests {
    func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> CardView {
        let sut = CardView()
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }

    func makeSpy(file: StaticString = #filePath, line: UInt = #line) -> CardViewSpy {
        let sut = CardViewSpy(frame: .zero)
        trackForMemoryLeak(sut, file: file, line: line)
        return sut
    }
}

final class CardViewSpy: CardView {
    var isColorAdjusted: Bool = false

    func clear() {
        isColorAdjusted = false
    }

    override func adjustColors() {
        super.adjustColors()
        isColorAdjusted = true
    }
}

extension UITraitCollection {
    // Traits affecting a variety of things but not anything that could change color appearance
    static func generateSimilarColorTraits(to startingTraits: UITraitCollection) -> [UITraitCollection] {
        // return each of these traits combined with startingTraits
        [
            UITraitCollection(horizontalSizeClass: .compact),
            UITraitCollection(verticalSizeClass: .compact),
            UITraitCollection(preferredContentSizeCategory: .accessibilityLarge),
            UITraitCollection(legibilityWeight: .bold)
        ].map({ UITraitCollection(traitsFrom: [startingTraits, $0]) })
    }

    // Traits with different values for traits that could affect color
    static func generateDifferentColorTraits() -> [UITraitCollection] {
        [
            UITraitCollection(),
            UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceIdiom: .pad),
                UITraitCollection(userInterfaceStyle: .light),
                UITraitCollection(displayGamut: .SRGB),
                UITraitCollection(accessibilityContrast: .normal),
                UITraitCollection(userInterfaceLevel: .base)
            ]),
            UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceIdiom: .phone),
                UITraitCollection(userInterfaceStyle: .dark),
                UITraitCollection(displayGamut: .SRGB),
                UITraitCollection(accessibilityContrast: .normal),
                UITraitCollection(userInterfaceLevel: .base)
            ]),
            UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceIdiom: .phone),
                UITraitCollection(userInterfaceStyle: .light),
                UITraitCollection(displayGamut: .P3),
                UITraitCollection(accessibilityContrast: .normal),
                UITraitCollection(userInterfaceLevel: .base)
            ]),
            UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceIdiom: .phone),
                UITraitCollection(userInterfaceStyle: .light),
                UITraitCollection(displayGamut: .SRGB),
                UITraitCollection(accessibilityContrast: .high),
                UITraitCollection(userInterfaceLevel: .base)
            ]),
            UITraitCollection(traitsFrom: [
                UITraitCollection(userInterfaceIdiom: .phone),
                UITraitCollection(userInterfaceStyle: .light),
                UITraitCollection(displayGamut: .SRGB),
                UITraitCollection(accessibilityContrast: .normal),
                UITraitCollection(userInterfaceLevel: .elevated)
            ]),
            UITraitCollection(userInterfaceIdiom: .tv),
            UITraitCollection(userInterfaceStyle: .dark),
            UITraitCollection(displayGamut: .P3),
            UITraitCollection(accessibilityContrast: .high),
            UITraitCollection(userInterfaceLevel: .elevated)
        ]
    }
}
