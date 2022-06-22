//
//  DSColors.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/20/22.
//

import UIKit

public enum DSColors: String, CaseIterable {
    case backgroundPrimary
    case backgroundSecondary
    case backgroundTertiary
    case contentPrimary
    case contentSecondary
    case contentTertiary
}

public extension DSColors {
    var color: UIColor? {
        UIColor(named: rawValue, in: .module, compatibleWith: nil)
    }
}
