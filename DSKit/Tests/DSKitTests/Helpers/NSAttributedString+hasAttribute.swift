//
//  NSAttributedString+hasAttribute.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 4/26/22.
//  Copyright © 2022 Y Media Labs. All rights reserved.
//

import Foundation

extension NSAttributedString {
    /// Checks whether an attributed string has an attribute applied to its entire range
    /// - Parameter key: the attribute to check for
    /// - Returns: returns true if the attributed string contains this attribute, otherwise false
    func hasUniversalAttribute(key: NSAttributedString.Key) -> Bool {
        var hasAttribute = false
        let rangeAll = NSRange(location: 0, length: length)
        enumerateAttribute(key, in: rangeAll, options: []) { value, range, _ in
            if range == rangeAll && value != nil {
                hasAttribute = true
            }
        }
        return hasAttribute
    }

    /// Returns the attribute value only if it applies to the entire attributed string.
    /// - Parameter key: the attribute to check for
    /// - Returns: returns true if the attributed string contains this attribute, otherwise false
    func getUniversalAttribute(for key: NSAttributedString.Key) -> Any? {
        var foundValue: Any?
        let rangeAll = NSRange(location: 0, length: length)
        enumerateAttribute(key, in: rangeAll, options: []) { value, range, _ in
            if range == rangeAll && value != nil {
                foundValue = value
            }
        }
        return foundValue
    }
}
