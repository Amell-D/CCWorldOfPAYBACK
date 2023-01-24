//
//  TransactionsCoordinator.swift
//  
//
//  Created by Amel Dizdarevic on 1/23/23.
//

import UIKit
import SwiftUI
// MARK: Modules
import NavigationCoordinatorKit
import UIComponentsKit
import NetworkKit

public protocol TransactionsCoordinatorProtocol: CoordinatorProtocol {
    func showDetails(for transaction: TransactionModel)
}

final public class TransactionsCoordinator: TransactionsCoordinatorProtocol {
    public var navigationController: UINavigationController
    var networkManager: RequestCalling

    public init(
        navigationController: UINavigationController,
        networkManager: RequestCalling
    ) {
        self.navigationController = navigationController
        self.networkManager = networkManager
        setupNavigationBar()
    }

    public func start() {
        let fetchingService = TransactionsFetchingService(networkManager: networkManager)
        let viewModel = TransactionsListViewModel(fetchingService: fetchingService)
        let viewController = UIHostingController(rootView: TransactionsListView(viewModel: viewModel, coordinator: self))
        viewController.title = NSLocalizedString("Transactions", comment: "Transactions")
        navigationController.pushViewController(viewController, animated: true)
    }

    public func showDetails(for transaction: TransactionModel) {
        let transactionDetailsCoordinator = TransactionDetailsCoordinator(navigationController: navigationController, transaction: transaction)
        transactionDetailsCoordinator.start()
    }

    private func setupNavigationBar() {
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.navigationBar.tintColor = .white
        navigationController.navigationBar.standardAppearance = NavigationBarAppearance.lightMode.select
    }
}
