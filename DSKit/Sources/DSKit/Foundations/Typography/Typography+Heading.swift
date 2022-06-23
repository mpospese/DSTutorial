//
//  Typography+Heading.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YMatterType

public extension Typography {
    struct Heading {
        /// Heading / Small (24/32 pt, medium)
        public static let small = Typography(
            familyName: "NotoSans",
            fontWeight: .medium,
            fontSize: 24,
            lineHeight: 32,
            textStyle: .title2
        )
    }
}
