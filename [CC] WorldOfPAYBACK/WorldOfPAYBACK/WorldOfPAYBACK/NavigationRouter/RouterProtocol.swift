//
//  MainRouter.swift
//  WorldOfPAYBACK
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import Foundation
import UIKit

protocol Router {

    var navigationController: UINavigationController { get }

    func start()
    func show(_ route: any NavigationRouter)
    func pop()
    func popToRoot()
    func dismiss()
}
