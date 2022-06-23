//
//  SceneDelegate.swift
//  DSTutorial
//
//  Created by Mark Pospesel on 6/21/22.
//

import UIKit
import DSKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // register the fonts
        try? NotoSansFontFamily.registerFonts()

        let window = UIWindow(windowScene: windowScene)

        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.contentPrimary]

        window.rootViewController = MainViewController()

        window.makeKeyAndVisible()
        self.window = window
    }
}
