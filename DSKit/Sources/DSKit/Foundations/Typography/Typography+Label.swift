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
        /// Label / Medium (16/20 pt, medium)
        public static let medium = Typography(
            familyName: "NotoSans",
            fontWeight: .medium,
            fontSize: 16,
            lineHeight: 20,
            textStyle: .callout
        )
    }
}