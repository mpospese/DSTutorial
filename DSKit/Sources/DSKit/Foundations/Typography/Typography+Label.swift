//
//  Typography+Label.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YMatterType

public extension Typography {
    struct Label {
        /// Label / Large (18/24 pt, medium)
        public static let large = Typography(
            familyName: "NotoSans",
            fontWeight: .medium,
            fontSize: 18,
            lineHeight: 24,
            textStyle: .body
        )

        /// Label / Medium (16/20 pt, medium)
        public static let medium = Typography(
            familyName: "NotoSans",
            fontWeight: .medium,
            fontSize: 16,
            lineHeight: 20,
            textStyle: .callout
        )

        /// Label / Small (14/16 pt, medium)
        public static let small = Typography(
            familyName: "NotoSans",
            fontWeight: .medium,
            fontSize: 14,
            lineHeight: 16,
            textStyle: .footnote
        )
    }
}
