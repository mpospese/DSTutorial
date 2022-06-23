//
//  Breakpoint.swift
//  DSKit
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit

/// Breakpoints for determining layouts and sizings
public enum Breakpoint {
    /// Small (320-599 pts) for phones and split-screen tablets
    case small
    /// Medium (600-1135 pts) for full-screen tablets
    case medium
    /// Large (1136+ pts) for external displays only (currently unused)
    case large
}

public extension Breakpoint {
    /// Returns the breakpoint that corresponds to the specified width
    static func breakpoint(for width: CGFloat) -> Breakpoint {
        switch width {
        case ..<600:
            return .small
        case ..<1136:
            return .medium
        default:
            return .large
        }
    }

    /// Returns the breakpoint that corresponds to the specified bounds.
    /// Uses the minimum of (width, height).
    static func breakpoint(for bounds: CGRect) -> Breakpoint {
        breakpoint(for: min(bounds.width, bounds.height))
    }

    /// Returns the breakpoint that corresponds to the current window dimensions.
    /// Result may change as key window size changes (e.g. tablet going from split-screen to full-screen).
    static func current() -> Breakpoint {
        guard let keyWindow = UIApplicationStub.shared.scenes
                .compactMap({ $0 as? WindowVendor })
                .first?
                .windows
                .first(where: { $0.isKeyWindow }) else {
                    // fallback to screen dimensions if there is no scene window yet
                    return breakpoint(for: UIScreen.main.bounds)
                }
        return breakpoint(for: keyWindow.bounds)
    }
}

struct UIApplicationStub {
    static var shared: SceneVendor = UIApplication.shared
}

// We can't easily create UIApplication and UIWindowScene for unit testing, but we will create
// protocols to mock out both classes.
protocol WindowVendor: AnyObject {
    var windows: [UIWindow] { get }
}

// UIWindowScene already conforms to WindowVendor
extension UIWindowScene: WindowVendor { }

// We add this protocol so that we can properly unit test Breakpoint.current
protocol SceneVendor {
    var scenes: [AnyObject] { get }
}

// UIApplication needs just a slight tweak to conform to SceneVendor
extension UIApplication: SceneVendor {
    var scenes: [AnyObject] { Array(connectedScenes) }
}
