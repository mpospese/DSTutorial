//
//  Colors.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit
import YCoreUI

// MARK: - Foundations

extension UIColor {
    static let primaryA = UIColor {
        let color: UIColor
        switch ($0.userInterfaceStyle, $0.accessibilityContrast) {
        case (.dark, .high):
            color = .white // lighter than gray200
        case (.dark, _):
            color = .gray200
        default:
            color = .black
        }
        return color
    }

    static let primaryB = UIColor {
        let color: UIColor
        switch ($0.userInterfaceStyle, $0.accessibilityContrast) {
        case (.dark, .high):
            color = .black // darker than gray900
        case (.dark, _):
            color = .gray900
        default:
            color = .white
        }
        return color
    }
}

// MARK: - Core

public extension UIColor {
    static let backgroundPrimary = UIColor.primaryB
    static let backgroundTertiary = UIColor { $0.userInterfaceStyle == .dark ? .gray700: .gray100 }

    static let contentPrimary = UIColor.primaryA
    static let contentTertiary = UIColor.gray500

    static let borderOpaque = UIColor { $0.userInterfaceStyle == .dark ? .gray700: .gray200 }
    static let borderSelected = UIColor.primaryA
}

// MARK: - Core Extensions

public extension UIColor {
    static let backgroundStateDisabled = UIColor { $0.userInterfaceStyle == .dark ? .gray800: .gray050 }

    static let contentStateDisabled = UIColor { $0.userInterfaceStyle == .dark ? .gray600: .gray400 }
}
