//
//  TransactionDetailsCoordinator.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import UIKit
import SwiftUI
// MARK: Modules
import NavigationCoordinatorKit

final class TransactionDetailsCoordinator: CoordinatorProtocol {
    var navigationController: UINavigationController
    var transaction: TransactionModel

    init(
        navigationController: UINavigationController,
        transaction: TransactionModel
    ) {
        self.navigationController = navigationController
        self.transaction = transaction
    }

    func start() {
        let viewController = UIHostingController(rootView: TransactionDetailsView(for: transaction))
        navigationController.pushViewController(viewController, animated: true)
    }
}
