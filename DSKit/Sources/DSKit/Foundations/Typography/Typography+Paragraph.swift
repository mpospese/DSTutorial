//
//  Typography+Paragraph.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YMatterType

public extension Typography {
    struct Paragraph {
        /// Paragraph / Medium (16/24 pt, regular)
        public static let medium = Typography(
            familyName: "NotoSans",
            fontWeight: .regular,
            fontSize: 16,
            lineHeight: 24,
            textStyle: .callout
        )

        /// Paragraph / Small (14/20 pt, regular)
        public static let small = Typography(
            familyName: "NotoSans",
            fontWeight: .regular,
            fontSize: 12,
            lineHeight: 20,
            textStyle: .footnote
        )
    }
}
