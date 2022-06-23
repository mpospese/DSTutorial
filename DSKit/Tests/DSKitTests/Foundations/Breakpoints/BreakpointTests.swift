//
//  BreakpointTests.swift
//  DSKitTests
//
//  Created by Mark Pospesel on 6/22/22.
//

import XCTest
@testable import DSKit

final class BreakpointTests: XCTestCase {
    func testBreakpointForWidth() {
        XCTAssertEqual(Breakpoint.breakpoint(for: -100), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: 0), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: 1), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: 300), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: 599), .small)

        XCTAssertEqual(Breakpoint.breakpoint(for: 600), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: 868), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: 1135), .medium)

        XCTAssertEqual(Breakpoint.breakpoint(for: 1136), .large)
        XCTAssertEqual(Breakpoint.breakpoint(for: 2048), .large)
        XCTAssertEqual(Breakpoint.breakpoint(for: 9999), .large)
        XCTAssertEqual(Breakpoint.breakpoint(for: 1000000000), .large)
    }

    func testBreakpointForBounds() {
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhoneSE1), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhone6S), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhoneX), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhone12), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhone6SPlus), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhoneXS), .small)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPhone12ProMax), .small)

        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPadPortrait), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPadLandscape), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPadMini6), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPad7thGen), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPadAir4thGen), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPad105Inch), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPad11Inch), .medium)
        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.iPadPro13), .medium)

        XCTAssertEqual(Breakpoint.breakpoint(for: CGRect.monitor6K), .large)
    }

    func testCurrentBreakpoints() {
        let current = Breakpoint.current()
        if UIDevice.current.userInterfaceIdiom == .phone {
            // Given simulator is iPhone, it should be small
            XCTAssertEqual(current, .small)
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            // Given simulator is iPad, it should not be large
            XCTAssertNotEqual(current, .large)
        }

        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPhone12)
        XCTAssertEqual(Breakpoint.current(), .small)

        UIApplicationStub.shared = UIApplicationMock(frame: CGRect.iPadLandscape)
        XCTAssertEqual(Breakpoint.current(), .medium)

        UIApplicationStub.shared =  UIApplicationMock(frame: CGRect.monitor6K)
        XCTAssertEqual(Breakpoint.current(), .large)

        UIApplicationStub.shared = UIApplication.shared
    }
}

extension CGRect {
    // MARK: - iPhone screen dimensions

    /// iPhone SE1, iPod Touch (7th gen)
    static let iPhoneSE1 = CGRect(x: 0, y: 0, width: 320, height: 568)

    /// iPhone 6S/7/8/SE2
    static let iPhone6S = CGRect(x: 0, y: 0, width: 375, height: 667)

    /// iPhone X/XS/11Pro, 12/13 mini
    static let iPhoneX = CGRect(x: 0, y: 0, width: 375, height: 812)

    /// iPhone 12/13
    static let iPhone12 = CGRect(x: 0, y: 0, width: 390, height: 844)

    /// iPhone 6S/7/8 Plus
    static let iPhone6SPlus = CGRect(x: 0, y: 0, width: 414, height: 736)

    /// iPhone XS/11 Pro Max
    static let iPhoneXS = CGRect(x: 0, y: 0, width: 414, height: 896)

    /// iPhone 12/13 Pro Max
    static let iPhone12ProMax = CGRect(x: 0, y: 0, width: 428, height: 926)

    // MARK: - iPad screen dimensions

    /// iPad 1st/2nd/3rd/4th/5th/6th gen, iPad mini 1/2/3/4/5, iPad Air 1st/2nd/3rd gen, portrait
    static let iPadPortrait = CGRect(x: 0, y: 0, width: 768, height: 1024)

    /// iPad 1st/2nd/3rd/4th/5th/6th gen, iPad mini 1/2/3/4/5, iPad Air 1st/2nd/3rd gen, landscape
    static let iPadLandscape = CGRect(x: 0, y: 0, width: 1024, height: 768)

    /// iPad mini 6
    static let iPadMini6 = CGRect(x: 0, y: 0, width: 744, height: 1133)

    /// iPad 7th/8th/9th gen
    static let iPad7thGen = CGRect(x: 0, y: 0, width: 810, height: 1080)

    /// iPad Air 4th gen
    static let iPadAir4thGen = CGRect(x: 0, y: 0, width: 820, height: 1180)

    /// iPad 10.5"
    static let iPad105Inch = CGRect(x: 0, y: 0, width: 834, height: 1112)

    /// iPad 11"
    static let iPad11Inch = CGRect(x: 0, y: 0, width: 834, height: 1194)

    /// iPad Pro 12.9"
    static let iPadPro13 = CGRect(x: 0, y: 0, width: 1024, height: 1366)

    // MARK: - other screen dimensions

    /// 6K monitor
    static let monitor6K = CGRect(x: 0, y: 0, width: 6144, height: 3160) // 6K
}

struct UIApplicationMock: SceneVendor {
    let scenes: [AnyObject]

    // creates one "scene" that has one "window" of the specified dimensions
    init(frame: CGRect) {
        let scene = UIWindowSceneMock(frame: frame)
        self.scenes = [scene]
    }
}

class UIWindowSceneMock: WindowVendor {
    let windows: [UIWindow]

    // creates one "window" of the specified dimensions
    init(frame: CGRect) {
        let window = UIWindow(frame: frame)
        window.makeKey()
        self.windows = [window]
    }
}

extension Breakpoint {
    // gets a mock for a screen size that will match the spectified breakpoint
    var mock: UIApplicationMock {
        let rect: CGRect
        switch self {
        case .small:
            rect = .iPhone12
        case .medium:
            rect = .iPadLandscape
        case .large:
            rect = .monitor6K
        }
        return UIApplicationMock(frame: rect)
    }
}
