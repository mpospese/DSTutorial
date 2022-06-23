//
//  NotoSansFontFamily.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YMatterType

public struct NotoSansFontFamily {
    /// Register all 3 NotoSans fonts
    public static func registerFonts() throws {
        let names = makeFontNames()
        try names.forEach {
            try UIFont.register(name: $0, fileExtension: "ttf", bundle: .module)
        }
    }

    /// Unregister all 3 NotoSans fonts
    public static func unregisterFonts() throws {
        let names = makeFontNames()
        try names.forEach {
            try UIFont.unregister(name: $0, fileExtension: "ttf", bundle: .module)
        }
    }

    private static func makeFontNames() -> [String] {
        [
            "NotoSans-Regular",
            "NotoSans-Medium",
            // Semibold is used for medium fonts when Accessibility Bold Text is enabled
            "NotoSans-SemiBold"
        ]
    }
}
