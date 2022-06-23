//
//  DSImages.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit

public enum DSImages: String, CaseIterable {
    case award
    case cow
    case mobile
    case security
}

public extension DSImages {
    var image: UIImage! {
        UIImage(named: rawValue, in: .module, compatibleWith: nil)
    }
}
