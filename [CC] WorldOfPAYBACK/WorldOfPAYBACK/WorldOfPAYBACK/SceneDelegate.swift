//
//  SceneDelegate.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/22/23.
//

import UIKit
import NavigationCoordinatorKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var applicationRouter: CoordinatorProtocol?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let applicationRouter = AppCoordinator(window: window)
            applicationRouter.start()

            self.applicationRouter = applicationRouter
            window.makeKeyAndVisible()
        }
    }
}

