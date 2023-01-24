//
//  AppCoordinator.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import NavigationCoordinatorKit
import NetworkKit
import UIKit
import TransactionsWPM

final class AppCoordinator: CoordinatorProtocol {

    let window: UIWindow
    var navigationController: UINavigationController
    @Injected var networkManager: RequestCalling

    init(window: UIWindow, navigationController: UINavigationController = UINavigationController()) {
        self.window = window
        self.navigationController = navigationController
    }

    func start() {
        window.rootViewController = navigationController
        showRootViewController()
    }

    private func showRootViewController() {
        let transactionsCoordinator = TransactionsCoordinator(navigationController: navigationController, networkManager: networkManager)
        transactionsCoordinator.start()
    }
}


